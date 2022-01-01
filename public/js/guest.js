$(function () {

    setTimeout(cart_quantity() , 2000);
        
    function cart_quantity() {

        var cart = $("#cart");

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr("content"),
            }
        });

        $.ajax({

            url: '/cart/quantity',
            type: "POST",
            success: function (data) {

                if (data.quantity > 0) {
                    cart.show();
                    cart.text(data.quantity);

                } else if (data.quantity <= 0) {

                    cart.hide();
                }

            },
            error: function (error) {
                $(document).html(error.responseText);
                console.log(error);
            }

        });

    }
    $(".addtocart").click(function (e) {

        e.preventDefault();

        var Id = $(this).data("id");

        var Name = $(this).data("name");

        var price = $(this).data("price");

        var fm = $(this).closest("form")[0];

        var Quantity = fm.quantity.value;

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr("content"),
            }
        });


        if ((Quantity == "" && !isNaN(Quantity)) || (Quantity >= 1 && !isNaN(Quantity))) {

            Quantity = (Quantity == "") ? 1 : Quantity;

            $.ajax({

                url: '/cart/add',
                type: "POST",
                data: {
                    product_id: Id,
                    product_name: Name,
                    quantity: Quantity,
                    price: price
                },
                complete: function () {

                    cart_quantity();
                },
                error: function (error) {

                    console.log(error);
                }

            });

            console.log(Quantity)

        } else if (Quantity <= 0 || isNaN(Quantity)) {
            console.log(Quantity)
            e.preventDefault();
            alert("Invalid Quantity");
            fm.quantity.value = "";
            return;
        }

    });

    $(".deletefromcart").click(function (e) {

        e.preventDefault();

        var Id = $(this).data("id");

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr("content"),
            }
        });

        $.ajax({

            url: '/cart/delete',
            type: "POST",
            data: {
                product_id: Id
            },
            success: function (data) {
                cart_quantity();
                location.reload();
            },
            error: function (error) {
                console.log(error);
            }

        });
    });
});
