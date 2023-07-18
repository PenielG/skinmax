
import re,random,os
from functools import wraps
from flask import render_template, request, redirect, flash,make_response,session,url_for
from sqlalchemy.sql import text
from skinapp import app, csrf
from skinapp.models import db,Admin,Brand,Skintype,Products,User,Order
from slugify import slugify

from skinapp.forms import SignupForm,ProfileForm,AdminLogin
from werkzeug.security import generate_password_hash, check_password_hash


# from bookapp.forms import ContactForm




# @app.route("/admin/login/",methods=["GET","POST"])
# def adminlogin():
#         adminlogin=AdminLogin()
#         if request.method == "GET":
#             return render_template("/admin/adminlogin.html",adminlogin=adminlogin)
#         else:
#             if adminlogin.validate_on_submit():
                    
#                 username=request.form.get("username")
#                 pwd=request.form.get("password")

#                 chk=Admin(admin_username=username,admin_pwd=pwd)
#                 if chk:
#                     session['admin_loggedin']=True
#                     return "correct"
#                 else:
#                     return "Incorrect"
#             else:
#                 return render_template("/admin/adminlogin.html",adminlogin=adminlogin)
            


# @app.route("/admin/login/", methods=["POST","GET"])
# def admin_login():
#     if request.method == "GET":
#          return render_template("/admin/login.html")
#     else:
#          username=request.form.get('username')
#          password=request.form.get('password')
#          deets=db.session.query(Admin).filter(Admin.admin_username==username,Admin.admin_pwd==password).count()
#          if deets:
#               session.get['admin_loggedin']=True
#               flash('You are successfully logged in')
#               return redirect("/admin/dashboard/")
#          else:
#               flash("Invalid Credentials")
#               return redirect("/admin/login/")


@app.route("/admin/login/", methods=["GET","POST"])
def admin_login():
    if request.method =="GET":
        return render_template("/admin/login.html")
    else:
        username=request.form.get("username")
        pwd=request.form.get("password")

        chk=db.session.query(Admin).filter(Admin.admin_username == username,Admin.admin_pwd == pwd).count()
        #.all(), if all() contains smt, it will give you a list, if it doesnt, it will give an empty list
        if chk:
            session['admin_loggedin']=True
            return redirect("/admin/dashboard")
        else:
            flash("incorrect credentials")
            return redirect("/admin/login/")
        
@app.route("/admin/dashboard/")
def adminhome():
    return render_template("admin/admin_dashboard.html")
            


@app.route("/admin/logout")
def admin_logout():
    if session.get("admin_loggedin"):
        session.pop("admin_loggedin", None)
        flash("You have logged out succesfully....")
    return redirect ("/admin/login")
    
        
@app.route("/admin/deleteproduct/<id>")
def delete_product(id):
    if session.get("admin_loggedin") == None:
        flash ("Access Denied")
        return redirect ("admin/login")
    else:
        b=db.session.query(Products).get_or_404(id)
        os.remove("skinapp/static/collections/"+b.prod_cover)
        db.session.delete(b)
        db.session.commit()
        flash(f"Book {b.product_name} has been deleted!", category="success")
        return redirect("/admin/products/")



@app.route("/admin/editproduct/<id>", methods=["GET", "POST"])
def edit_product(id):
    if session.get("admin_loggedin") is None:
        flash("Access Denied")
        return redirect("admin/login")
    else:
        if request.method == "GET":
            skintype=Skintype.query.get_or_404(id)
            addproduct=db.session.query(Brand).get_or_404(id)
            product = db.session.query(Products).get_or_404(id)
            return render_template("/admin/edit_product.html",addproduct=addproduct,skintype=skintype,product=product)
        else:
            product = db.session.query(Products).get_or_404(id)
            # Update the product with the submitted form data
            product_name = request.form.get("product_name")
            product_description = request.form.get("product_desc")
            # Update other fields as needed
            # ...
            db.session.add()
            db.session.commit()
            flash(f"Product {product.product_name} has been updated!", category="success")
            return redirect("/admin/products/")
  



        





      

# @app.route("/admin/newbook", methods=["GET","POST"])
# def add_newbook():
#     if session.get('admin_loggedin') == None: #user is not log in
#         flash("Access Denied")
#         return redirect("/admin/login/")
    
#     if request.method =='GET':
#         cats=db.session.query(Category).all()
#         return render_template("admin/addbook.html",cats=cats)
#     else:
#         bookcat=request.form.get('bookcat') #these are what we have in the name of each input tag
#         title=request.form.get('title')
#         year=request.form.get('year')
#         status=request.form.get('status')
#         cover=request.files.get('cover')
#         desc=request.form.get('desc')

#         #validate title and file
#         if title != '' and cover:
#             filename=cover.filename
#             allowed=['.jpg','.png','.jpeg']
#             name,ext=os.path.splitext(filename)
#             newname=str(random.random()* 1000000) +ext
#             if ext.lower() in allowed:
#                 cover.save("bookapp/static/collections/"+ newname)
#                 b=Book(book_title=title,book_desc=desc,book_cover=newname,book_publication=year,book_catid=bookcat,book_status=status)
#                 db.session.add(b)
#                 db.session.commit()
#                 flash("Book has been added",category='success')
#                 return redirect("/admin/books")
#             else:
#                 flash("Please upload only type jpg, png or jpeg",category="danger")
#                 return redirect("/admin/newbook")
#         else:
#             flash("Please ensure you complete the required fileds",category="danger")
#             return redirect("/admin/newbook")

 

@app.route("/admin/newproduct/", methods=["POST","GET"])
def add_newproduct():
    if session.get("admin_loggedin") == None:
        flash("Access Denied")
        return redirect("/admin/login/")
        
    if request.method=="GET":
        skintype=Skintype.query.all()
        addproduct=db.session.query(Brand).all()
        return render_template("/admin/add_newproduct.html",addproduct=addproduct,skintype=skintype)
    else:
        brand=request.form.get('prodbrand')
        productname=request.form.get('name')
        prod_descrip=request.form.get('desc')
        prod_price=request.form.get('price')
        prod_new_price = prod_price.replace('₦', '')
        prod_skintype=request.form.get('skintype')
        product_cover=request.files.get('cover')

        if productname and product_cover:
            slugified_name = slugify(productname)
            filename=product_cover.filename
            allowed=['.jpg','.png','.jpeg']
            name,ext=os.path.splitext(filename)
            newname=str(random.random()* 1000000) +ext
            if ext.lower() in allowed:
                    product_cover.save("skinapp/static/collections/"+ newname)
                    product=Products(product_brand=brand,product_name=productname,product_price=prod_new_price,product_desc=prod_descrip,prod_cover=newname,product_skintypeid=prod_skintype,product_slug=slugified_name)
                    db.session.add(product)
                    db.session.commit()
                    flash("Product has been added",category='success')
                    return redirect("/admin/products")
            else:
                flash("Please upload only type jpg, png or jpeg",category="danger")
                return redirect("/admin/newproduct/")
        else:
            flash("Please ensure you complete the required fileds",category="danger")
            return redirect("/admin/newproduct/")



@app.route("/admin/products/")
def manage_product():
    if session.get('admin_loggedin') != None: #admin is logged in
        products=db.session.query(Products).all()
        return render_template("admin/allproducts.html",products=products)
    else:
        flash("Access Denied", category='danger')
        return redirect("/admin/login/")
    
@app.route("/admin/users/")
def manage_users():
    if session.get('admin_loggedin') != None: #admin is logged in
        users=db.session.query(User).all()
        return render_template("admin/manage_users.html",users=users)
    else:
        flash("Access Denied", category='danger')
        return redirect("/admin/login/")

@app.route("/admin/orders/")
def manage_orders():
    if session.get('admin_loggedin') != None: #admin is logged in
        users=db.session.query(User).all()
        order=db.session.query(Order).all()
        
        return render_template("admin/manage_orders.html",users=users,order=order)
    else:
        flash("Access Denied", category='danger')
        return redirect("/admin/login/")
    
@app.errorhandler(404)
def notfound(error):
    return render_template("admin/404.html",error=error),404



@app.errorhandler(500)
def programmingerror(error):
    return "Something went wrong. We are still in control please try again later",500



       





    


    

   


