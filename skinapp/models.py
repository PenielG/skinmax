from datetime import datetime
from flask_sqlalchemy import SQLAlchemy
from slugify import slugify

db=SQLAlchemy()

def __init__(self, productname):
        self.product_name = productname
        self.product_slug = self.generate_slug()


def generate_slug(self):
        return slugify(self.product_name)


class Admin(db.Model):
    admin_id=db.Column(db.Integer, autoincrement=True,primary_key=True)
    admin_username=db.Column(db.String(20),nullable=True)
    admin_pwd=db.Column(db.String(200),nullable=True)





class Brand(db.Model):
    brand_id=db.Column(db.Integer, autoincrement=True,primary_key=True)
    brand_name=db.Column(db.String(20),nullable=True)

    #set relationship
    productbrand=db.relationship("Products",back_populates="branddeets")





class Order(db.Model):
    order_id = db.Column(db.Integer, autoincrement=True,primary_key=True)
    order_userid = db.Column(db.Integer, db.ForeignKey('user.user_id'),nullable=False) 
    order_productid = db.Column(db.Integer, db.ForeignKey('products.product_id'),nullable=False)  
    order_state_id = db.Column(db.Integer, db.ForeignKey('state.state_id'),nullable=False) 
    # order_orderstatus_id = db.Column(db.Integer, db.ForeignKey('orderstatus.orderstatus_id'),nullable=False) 
    order_status =db.Column(db.Enum('pending','failed','paid'),nullable=False, server_default=("pending"))  
    order_lga_id = db.Column(db.Integer, db.ForeignKey('lga.lga_id'),nullable=False) 
    order_refno=db.Column(db.String(100),nullable=False)
    order_amount = db.Column(db.Float,nullable=False) 
    order_product_qty =db.Column(db.Integer,nullable=False)
    order_email=db.Column(db.String(100),nullable=True)
    order_date =db.Column(db.DateTime(), default=datetime.utcnow)
    order_delivery_address = db.Column(db.String(255),nullable=False)
    order_unitprice= db.Column(db.Float,nullable=False) 
    
  

     #set relationship
    stateof_order=db.relationship("State",back_populates="order_state")
    lgaof_order=db.relationship("Lga",back_populates="order_lga")
    # orderstatus=db.relationship("OrderStatus",back_populates="order")
    user_order=db.relationship("User",back_populates="orderbyuser")
    paymentorder=db.relationship("Payment",back_populates="orderstatus")
    product_ordered=db.relationship("Products",back_populates="ordered_product")

   




class Payment(db.Model):
    payment_id = db.Column(db.Integer, autoincrement=True,primary_key=True)
    payment_userid = db.Column(db.Integer, db.ForeignKey('user.user_id'),nullable=False) 
    payment_orderid = db.Column(db.Integer, db.ForeignKey('order.order_id'),nullable=False)  
    payment_date =db.Column(db.DateTime(), default=datetime.utcnow)
    payment_status = db.Column(db.Boolean, default=False)
    pament_amount = db.Column(db.Float,nullable=False) 

  

     #set relationship
    user_payment=db.relationship("User",back_populates="paymentbyuser")
    orderstatus=db.relationship("Order",back_populates="paymentorder")


class State(db.Model):
    state_id = db.Column(db.Integer, autoincrement=True,primary_key=True)
    state_name = db.Column(db.String(255),nullable=False)  
 


     #set relationship
    localgovt = db.relationship("Lga",back_populates="state")
    order_state = db.relationship("Order",back_populates="stateof_order")
    
  



class Lga(db.Model):
    lga_id = db.Column(db.Integer, autoincrement=True,primary_key=True)
    lga_stateid = db.Column(db.Integer, db.ForeignKey('state.state_id'),nullable=False)   
    lga_name = db.Column(db.String(255),nullable=False)  
 


     #set relationship
    state = db.relationship("State",back_populates="localgovt")
    order_lga = db.relationship("Order",back_populates="lgaof_order")

  
class Products(db.Model):
    product_id = db.Column(db.Integer, autoincrement=True,primary_key=True)
    product_skintypeid = db.Column(db.Integer, db.ForeignKey('skintype.skintype_id'),nullable=False) 
    product_brand = db.Column(db.Integer, db.ForeignKey('brand.brand_id'),nullable=False) 
    product_slug = db.Column(db.String(100), unique=True)
    prod_cover= db.Column(db.String(100))   
    product_name = db.Column(db.String(255),nullable=False)
    product_price = db.Column(db.Float,nullable=False) 
    product_desc = db.Column(db.Text())
    

    #set relationships
    skin_product = db.relationship("Skintype", back_populates="user_products")
    branddeets=db.relationship("Brand",back_populates="productbrand")
    ordered_product=db.relationship("Order",back_populates="product_ordered")
    product_reviews = db.relationship("Reviews", back_populates="product")
    






class Reviews(db.Model):
    rev_id = db.Column(db.Integer, autoincrement=True,primary_key=True)
    rev_userid = db.Column(db.Integer, db.ForeignKey('user.user_id'),nullable=False)  
    rev_text = db.Column(db.String(255),nullable=False)
    rev_title = db.Column(db.String(255),nullable=False)
    rev_date =db.Column(db.DateTime(), default=datetime.utcnow)
    rev_productid =db.Column(db.Integer, db.ForeignKey('products.product_id'),nullable=False)  
    
    
    #set relationships
    reviewby = db.relationship("User", back_populates="user_reviews")
    product = db.relationship("Products", back_populates="product_reviews")

class Message(db.Model):
    msg_id = db.Column(db.Integer, autoincrement=True,primary_key=True)
    msg_name = db.Column(db.String(100),nullable=False)
    msg_phoneno = db.Column(db.String(255),nullable=False)
    msg_text = db.Column(db.String(255),nullable=False)
    msg_date =db.Column(db.DateTime(), default=datetime.utcnow)
    




class User(db.Model):  
    user_id = db.Column(db.Integer, autoincrement=True,primary_key=True)
    user_skintype_id= db.Column(db.Integer, db.ForeignKey('skintype.skintype_id'),nullable=False)
    user_fullname = db.Column(db.String(100),nullable=False)
    user_email = db.Column(db.String(120)) 
    user_pwd=db.Column(db.String(120),nullable=True)
    user_pix=db.Column(db.String(120),nullable=True) 
    user_datereg=db.Column(db.DateTime(), default=datetime.utcnow)#default 
    
    #set relationship  
    orderbyuser=db.relationship("Order",back_populates="user_order")  
    user_reviews=db.relationship("Reviews",back_populates='reviewby') 
    skintype=db.relationship("Skintype",back_populates='user_skintype')    
    paymentbyuser=db.relationship("Payment",back_populates="user_payment")
 
 



  
class Skintype(db.Model):  
    skintype_id = db.Column(db.Integer, autoincrement=True,primary_key=True)
    skintype_name = db.Column(db.String(100),nullable=False)
    
    #set relationship    
    user_products=db.relationship("Products",back_populates='skin_product') 
    user_skintype = db.relationship("User", back_populates="skintype")
    
        








