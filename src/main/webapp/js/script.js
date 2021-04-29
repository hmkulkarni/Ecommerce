function addToCart(pid, pname, price) {
    let cart = localStorage.getItem("cart");
    if (cart === null) {
        // No cart present. Make a cart
        let products = [];
        let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price};
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        // console.log("Product added for first time");
        showToast("Item added to cart");
    } else {
        // Display contents of the cart
        let pcart = JSON.parse(cart);
        let existing = pcart.find((item) => item.productId === pid);
        if (existing) {
            // Increase the quantity
            existing.productQuantity = existing.productQuantity + 1;
            pcart.map((item) => {
                if (item.productId === existing.productId) {
                    item.productQuantity = existing.productQuantity;
                }
            });
            localStorage.setItem("cart", JSON.stringify(pcart));
            // console.log("Product Quantity Increased");
            showToast("Product quantity increased");
        } else {
            // Add another product
            let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price};
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("New product is added");
            showToast("Product is added to cart");
        }
    }
    updateCart();
}

// Update the cart
function updateCart() {
    let temp = localStorage.getItem("cart");
    let cart = JSON.parse(temp);
    if (cart === null || cart.length === 0) {
        // Cart is empty
        console.log("Cart is empty");
        $(".cart-items").html("(0)");
        $(".cart-body").html("<h3>Cart doesn't have any items yet</h3>");
        $(".checkout-btn").attr("disabled", true);
    } else {
        // There is something in the cart
        console.log(cart);
        $(".cart-items").html(`(${cart.length})`);
        let table = `
            <table class='table'>
                <thead class='thead-light'>
                    <tr>
                        <th>Item Name </th>
                        <th>Price </th>
                        <th>Quantity </th>
                        <th>Total Price </th>
                        <th>Action </th>
                    </tr>
                </thead>
        `;

        let totalPrice = 0;
        let totalQuantity = 0;
        cart.map((item) => {
            table = table + `
                <tr>
                    <td width=300px>${item.productName}</td>
                    <td>₹${item.productPrice}</td>
                    <td><button style='border-radius: 10px; font-size: 10px' class='btn btn-outline-danger btn-sm'>-</button><span id='quantity'> &nbsp;${item.productQuantity} &nbsp;</span><button onclick='addQuantity()' style='border-radius: 10px; font-size: 10px' class='btn btn-outline-success btn-sm'>+</button></td>
                    <td>₹${item.productQuantity * item.productPrice}</td>
                    <td><button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'>Remove</button></td>
                </tr>
            `;
            totalPrice = totalPrice + (item.productPrice * item.productQuantity);
            totalQuantity = totalQuantity + item.productQuantity;
        });
        if (totalQuantity === 1) {
            table = table + `
                    <tr>
                        <td colspan='5' class='text-right'><h6>Subtotal (${totalQuantity} item)</h6></td>
                    </tr>
            `;
        } else {
            table = table + `
                    <tr>
                        <td colspan='5' class='text-right'><h6>Subtotal (${totalQuantity} items)</h6></td>
                    </tr>
            `;
        }
        table = table + `
                    <tr>
                        <td colspan='5' class='text-right'><h5>Payable amount = ₹${totalPrice}</h5></td>
                    </tr>
                    </table>
        `;
        $(".cart-body").html(table);
        $(".checkout-btn").attr("disabled", false);
    }
}

// Delete item from the cart
function deleteItemFromCart(pid) {
    let cart = JSON.parse(localStorage.getItem("cart"));
    let newCart = cart.filter(item => item.productId !== pid);
    localStorage.setItem("cart", JSON.stringify(newCart));
    updateCart();
    showToast("Item removed from cart");
}

function addQuantity() {
    let cart = JSON.parse(localStorage.getItem("cart"));
    cart.map(item => {
        let totalPrice = item.productPrice;
        let itemQty = document.getElementById("quantity");
        itemQty.value = item.productQuantity;
        itemQty++;
        updatedQty = itemQty;
        totalPrice = totalPrice + item.productQuantity * item.productPrice;

    });
    updateCart();
}

$(document).ready(function () {
    updateCart();
});


function notLoggedIn() {
    document.location.href = "login.jsp";
    showToast("Please login first before adding items to the cart");
}

function showToast(content) {
    $("#toast").addClass("display");
    $("#toast").html(content);
    setTimeout(() => {
        $("#toast").removeClass("display");
    }, 2000);
}

function proceedToCheckout() {
    window.location = "checkout.jsp";
}
function returnToHome() {
    window.location = "index.jsp";
}