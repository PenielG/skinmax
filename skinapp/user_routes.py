import re,random,requests,os,json
from functools import wraps
from flask import render_template, request, redirect, flash,make_response,session,url_for,jsonify
from sqlalchemy.sql import text
from skinapp import app, csrf
from skinapp.models import db,Admin,User,Skintype,Products,Brand,Order,State,Lga,Reviews
from slugify import slugify
from skinapp.forms import SignupForm,ProfileForm,AdminLogin,MessageForm
from werkzeug.security import generate_password_hash, check_password_hash









@app.route("/")
@app.route("/home/")    
def home():
    msgform=MessageForm()
    products=db.session.query(Products).all()
    # for product in products:
    #     product.product_slug = slugify(product.product_name)  # Assuming product_name is the attribute 
    return render_template("user/index.html",pagename="home page",products=products,msgform=msgform)


@app.route("/demo")
def demo():
    return render_template("user/home.html")



@app.route("/message/")
def message():
    msgform=MessageForm()
    return render_template("/user/index.html",msgform=msgform)


@app.route("/signup/",methods=['GET','POST'])
def signup():
    signupform=SignupForm()
    if request.method=="GET":
        skintype=Skintype.query.all()
        return render_template("/user/signup.html",signupform=signupform,skintype=skintype)
    else:
        
        if signupform.validate_on_submit():
           
            skintype=request.form.get('skintype')
            fullname=request.form.get('fullname')
            password=request.form.get('password')
            email=request.form.get('email')
            hashedpwd=generate_password_hash(password)
            user=User(user_fullname=fullname,user_email=email,user_pwd=hashedpwd,user_skintype_id=skintype)
            db.session.add(user)
            db.session.commit()
            #log in the user
            session['user_id']=user.user_id
            session['user_loggedin']=True
            flash("You Signed up Successfully")
            return redirect("/login/")
        else:
            return render_template("/user/signup.html",signupform=signupform)


def login_required(f):
    @wraps(f)  #from functools import wraps
    def login_decorator(*args,**kwargs): #"**kwargs" keyworded argument for unpacking dictionary,*args for unpacking a list
        if session.get("user_id") and session.get('user_loggedin'):
           return f(*args,**kwargs)
        else:
            flash("Access Denied, Please login")
            return redirect ("/login")
    return login_decorator
  
 
@app.route("/profile/",methods=['GET','POST'])
@login_required
def profile():
    pform=ProfileForm()
    useronline=session.get('user_id')
    userdeets=db.session.query(User).get(useronline)
    if request.method=='GET':
      
        return render_template("user/profile.html",pform=pform,userdeets=userdeets)   
    else:
        if pform.validate_on_submit():
            fullname=request.form.get('fullname')#pform.fullname.data
            picture=request.files.get('pix')#pform.pix.filename
            filename=pform.pix.data.filename
            picture.save("skinapp/static/images/profile/"+filename)
            userdeets.user_fullname=fullname #userdeets.user_pwd=hash of what is comming iin
            userdeets.user_pix=filename
            db.session.commit()
            flash("Profile updated")
            return redirect("/user/dashboard")
        else:
            return render_template("user/profile.html",pform=pform,userdeets=userdeets)      
        


@app.route("/aboutus/")
def aboutus():
    return render_template("about.html")


@app.route("/user/dashboard/")
@login_required 
def dashboard():
    useronline=session.get('user_id')
    userdeets=db.session.query(User).get(useronline)
    return render_template("user/dashboard.html",userdeets=userdeets)

        
@app.route("/login/",methods=['GET','POST'])
def login():
    if request.method=='GET':
        return render_template("user/login.html")
    else:
        #we are using the below method because we are using non flask form
        username=request.form.get('email')#give form input name='email'
        password=request.form.get('password')#give form input name='password'
        deets=db.session.query(User).filter(User.user_email==username).first()#will give <userid> an object
        if deets:
            hashedpwd=deets.user_pwd
            chk=check_password_hash(hashedpwd,password)
            if chk:
                session['user_loggedin']=True
                session['user_id']=deets.user_id
                return redirect ("/user/dashboard")
            else:
                flash("Invalid Password")
                return redirect ("/login")
        else:
            flash("Invalid Username")
            return redirect ("/login")
        
@app.route("/signout")
def signout():
    if session.get('user_id') or session.get('user_loggedin'):
        session.pop('user_id', None)
    return redirect("/")

@app.route("/oilskin/")
def oil_skin():
        product=db.session.query(Products).filter(Products.product_skintypeid=="2").all()
        return render_template("user/oily_skin.html",product=product)


@app.route("/normalskin/")
def normal_skin():
        product=db.session.query(Products).filter(Products.product_skintypeid=="1").all()
        return render_template("user/normal_skin.html",product=product)

@app.route("/sensitiveskin/")
def sensitive_skin():
        product=db.session.query(Products).filter(Products.product_skintypeid=="5").all()
        return render_template("user/sensitive_skin.html",product=product)

@app.route("/dryskin/")
def dry_skin():
        product=db.session.query(Products).filter(Products.product_skintypeid=="3").all()
        return render_template("user/dry_skin.html",product=product)


@app.route("/explore/",methods=['POST','GET'])
def explore():
    products=db.session.query(Products).all()
    # .filter(Book.book_status=='1').order_by(Book.book_id.desc()).limit(4).all()
    brand=db.session.query(Brand).all()
    return render_template('user/explore.html', brand=brand,products=products)


@app.route('/search/product')
def search_book():
    brand = request.args.get('brand')
    name = request.args.get('name') 
    search_title = "%"+name+"%" # "%{}%".format(title)
    #run query
    if brand =="":
        result = db.session.query(Products).filter(Products.product_name.ilike(search_title)).all()
    else:
        result = db.session.query(Products).filter(Products.product_brand==brand).filter(Products.product_name.ilike(search_title)).all()

    #result = [<Book 1>, <Book 2>, <Book 3>] 
    toreturn =""
    for product in result:
        toreturn = toreturn + f"<div class='col'><img src='/static/collections/{product.prod_cover}' class='img-fluid bk'><div class='deets'><h6><a href='/review/{product.product_id}'>{product.product_name}</a></h6><p><i>{product.branddeets.brand_name}</i></p><p><button class='btn btn-sm btn-warning'{len(product.product_reviews)}>Reviews</button></p></div></div>"
    
    return toreturn


        

@app.route("/paystack", methods=['POST'])
def paystack():
    if session.get('ref') != None:
        ref = session['ref']
        trx = db.session.query(Order).filter(Order.order_refno==ref).first()
        useronline = session.get('userid')    
        userdeets = db.session.query(User).get(useronline)
        email = trx.order_email
        amount = trx.order_amount
        #we want to connect to paystack api
        url ="https://api.paystack.co/transaction/initialize"
        
        headers = {"Content-Type": "application/json","Authorization":"Bearer sk_test_671dd0a9961b0a31479c06b90a00f5ec0ba4280b"}
        
        data = { "email": email, "amount": amount*100, "reference":ref }
        response = requests.post(url, headers=headers, data=json.dumps(data))
        rspjson = response.json()
        if rspjson['status'] == True:
            paygateway = rspjson['data']['authorization_url']
            flash('Your Payment has been processed')
            return redirect("/user/dashboard")
        else:
            return rspjson    
    else:
        return redirect("/donate")
    

@app.route("/payment/")   
def make_payment():
    #To get the particular signed in
    userdeets = db.session.query(User).get(session.get('user_id'))
    if session.get('ref') !=None:
        ref = session['ref']
        #TO DO: we want to get the details of the transaction and display to the user
        trxdeets = db.session.query(Order).filter(Order.order_refno==ref).first()
        return render_template("user/payment.html", trxdeets=trxdeets,userdeets=userdeets)
    else:
        return redirect(url_for('order_product', slug='product.product_slug|urlencode'))
    


@app.route("/landing")
def paystack_landing():
    ref=session.get('ref')
    if ref ==None:
        return redirect('/donate')
    else:
        headers={"Content-Type": "application/json","Authorization":"Bearer sk_test_671dd0a9961b0a31479c06b90a00f5ec0ba4280b"}
        verifyurl= "https://api.paystack.co/trasaction/verify/"+str(ref)
        response=requests.get(verifyurl,headers=headers)
        rspjson=response.get_json()
        return rspjson
       





@app.route("/product/<slug>", methods=["GET", "POST"])
def order_product(slug):
    useronline = session.get('user_id')
    userdeets = db.session.query(User).get(useronline)
    product = Products.query.filter_by(product_slug=slug).first()
    states = State.query.all()
    lga=Lga.query.all()

    if product:
        if request.method == "POST":
            if not useronline:
                flash('Please sign up to make an order')
                return redirect("/signup/")

            user_email = userdeets.user_email if userdeets else None
            product_price = float(request.form.get('product_price'))
            quantity = request.form.get('order_qty')
            state_id = request.form.get('order_state')
            product_id = request.form.get('product_id')
            order_del_addr = request.form.get('delivery_addr')
            lga_id = int(request.form.get('order_lga'))

            # Calculate the total price
            new_quantity = int(quantity)
            total_price = product_price * new_quantity

            refno = int(random.random() * 100000000)
            order = Order(order_userid=useronline, order_productid=product_id, order_product_qty=quantity, order_amount=total_price, order_unitprice=product_price, order_state_id=state_id, order_delivery_address=order_del_addr, order_refno=refno, order_status="pending", order_email=user_email,order_lga_id=lga_id)
            db.session.add(order)
            db.session.commit()

            # To generate a reference no
            session['ref'] = refno
            return redirect("/payment/")
        else:
            return render_template("user/order_layout.html", product=product, states=states,lga=lga)
    else:
        return "Product not found"


@app.route('/show_lga')
def show_lga():
    stateid = request.args.get('stateid')
    lgas = db.session.query(Lga).filter(Lga.lga_stateid == stateid).all()
    lga_options = ""
    for lga in lgas:
        lga_options += f'<option value="{lga.lga_id}">{lga.lga_name}</option>'
    return lga_options

@app.route("/reviews/<productid>")
def reviews(productid):
    products=Products.query.all()
    productid=db.session.query(Products).get_or_404(productid)
    return render_template("user/review.html",productid=productid,products=products)

@app.route("/allproduct_reviews/")
def all_productreviews():
    review=Reviews.query.all()
    return render_template ("user/allreviews.html", review=review)

@app.route("/submitreview",methods=['POST'])
@login_required
def submit_review():
    title=request.form.get('productname')
    text=request.form.get('review')
    productid=request.form.get('productid')
    useronline=session.get('user_id')
    #insert this review
    review=Reviews(rev_text=text,rev_title=title,rev_productid=productid,rev_userid=useronline)
    db.session.add(review)
    db.session.commit()
    flash("Thank you, your review has been submitted")
    return redirect("/user/dashboard/")


        
    


@app.route("/skintype/")
def skintype():
    return render_template("skintype.html")

@app.route("/routine/")
def routine():
    return render_template("routines.html")

@app.route("/skinglow/")
def skinglow():
    return render_template("skinglow.html")


@app.route("/myorders")
def my_orders():
    useronline=session.get('user_id')
    userdeets=db.session.query(User).get(useronline)
    user_id = session.get('user_id')
    order = db.session.query(Order).filter(Order.order_userid == user_id).all()
    return render_template("user/my_orders.html", order=order,userdeets=userdeets)        


@app.errorhandler(500)
def programmingerror(error):
    return "Something went wrong. We are still in control please try again later",500
























