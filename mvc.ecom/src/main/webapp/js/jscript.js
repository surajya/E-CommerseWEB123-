function add_to_cart(pid,pname,pprice){
	let cart=localStorage.getItem("cart")
	if(cart==null){
		//not cart yet
		let products=[]
		let product={productId:pid,productName:pname,productQuantity:1,productPrice:pprice}
		products.push(product)
		localStorage.setItem("cart",JSON.stringify(products))
		console.log("product is add first time")
	}else{
		//cart is already present
		let pCart=JSON.parse(cart)
		let oldProduct=pCart.find((item)=>item.productId==pid)
		if(oldProduct){
			//add at once
			oldProduct.productQuantity=oldProduct.productQuantity+1
			pCart.map((item)=>{
				if(item.productId==oldProduct.productId){
					item.productQuantity=oldProduct.productQuantity
				}
			})
			localStorage.setItem("cart",JSON.stringify(pCart))
			console.log("product quantity is increased")
		}else{
			//add new product
			let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: pprice }
			pCart.push(product)
			localStorage.setItem("cart", JSON.stringify(pCart))
			console.log("product is add")
		}
	}
	updateCart()
	
}

//update cart:
function updateCart(){
	let cartString=localStorage.getItem("cart")
	let cart=JSON.parse(cartString)
	if(cart==null || cart.length==0){
		console.log("cart is empty")
		$(".cart-items").html("(0)")
		$(".cart-body").html("<h3>Cart does not have any items</h3>")
		$(".checkout-btn").addClass('disabled')
	}else{
		
		console.log(cart)
		$(".cart-items").html(`(${cart.length})`)
		
		let table=`
			<table class='table'>
			<thead class='thead-item'>
				<tr>
					<th>ItemName</th>
					<th>ItemPrice</th>
					<th>ItemQuantity</th>
					<th>TotalPrice</th>
				</tr>
			
			</thead>
		`;
		let totalPrice=0
		cart.map((item)=>{
			table +=`
					<tr>
						<th>${item.productName}</th>
						<th>${item.productPrice}</th>
						<th>${item.productQuantity}</th>
						<th>${item.productPrice*item.productQuantity}</th>
						<th><button class='btn btn-danger btn-sm'>Remove</button></th>
					</tr>
					
					${totalPrice+=item.productPrice*item.productQuantity}
			`
		})
		
		table=table+`<tr><td colspan='5' class='text-right font-weight-bold m-5'>Total Price:${totalPrice}</td></tr></table>`
		$(".cart-body").html(table)
	}
}
$(document).ready(function(){
	updateCart()
})
