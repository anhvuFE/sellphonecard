<%-- 
    Document   : buyCard
    Created on : Jun 14, 2023, 1:25:08 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            /* Apply a consistent indentation */
            html,
            body {
                margin: 0;
                padding: 0;
            }

            .form {
                /* Use a descriptive class name */
                font-family: Arial, sans-serif;
                font-size: 16px;
                color: #333;
                background-color: #f4f4f4;
                border: 1px solid #ddd;
                padding: 20px;
                border-radius: 5px;
                
            }

            .container {
                padding: 30px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                margin: 20px auto;
                max-width: 600px;
            }

            h1 {
                font-size: 36px;
                margin-bottom: 20px;
            }

            .denomination-btns {
                margin-bottom: 10px;
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
            }

            .denomination-btns button {
                background-color: #337ab7;
                color: #fff;
                border: none;
                border-radius: 3px;
                padding: 10px 20px;
                margin-right: 10px;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .denomination-btns button:hover {
                background-color: #23527c;
            }

            /* Use a consistent color palette */
            label {
                display: block;
                margin-bottom: 10px;
                font-size: 20px;
                font-weight: 500;
                color: #333;
            }

            input[type="number"] {
                width: 60px;
                padding: 12px;
                font-size: 16px;
                border-radius: 8px;
                border: 1px solid #ddd;
            }

            button[type="submit"] {
                padding: 14px 24px;
                background-color: #4caf50;
                color: #fff;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                font-size: 20px;
                font-weight: 500;
                transition: all 0.2s ease-in-out;
            }

            button[type="submit"]:hover,
            button[type="submit"]:focus {
                background-color: #2e7d32;
            }

            #quantity {
                width: 50px;
                padding: 5px;
                border: 1px solid #ccc;
                border-radius: 3px;
                margin-left: 5px;
            }

            /* Add comments to make it easier to understand and maintain */
            /* Denomination buttons */
            .denomination-btns {
                margin-bottom: 10px;
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
            }

            .denomination-btns button {
                background-color: #337ab7;
                color: #fff;
                border: none;
                border-radius: 3px;
                padding: 10px 20px;
                margin-right: 10px;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .denomination-btns button:hover {
                background-color: #23527c;
            }
            
            .denomination-btns button.active {
                background-color: #4caf50;
                color: greenyellow;
            }

            /* Quantity input */
            label {
                display: block;
                margin-bottom: 10px;
                font-size: 20px;
                font-weight: 500;
                color: #333;
            }

            input[type="number"] {
                width: 60px;
                padding: 12px;
                font-size: 16px;
                border-radius: 8px;
                border: 1px solid #ddd;
            }

            #quantity {
                width: 50px;
                padding: 5px;
                border: 1px solid #ccc;
                border-radius: 3px;
                margin-left: 5px;
            }

            /* Submit button */
            button[type="submit"] {
                padding: 14px 24px;
                background-color: #4caf50;
                color: #fff;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                font-size: 20px;

            </style>
        </head>
        
        <body>
        <center>
            <div class="form">
                <h3>Choose one denomination</h3>
                <div class="denomination-btns">
                    <button type="button" onclick="selectDenomination(20000)" id="denomination20000">20k</button>
                    <button type="button" onclick="selectDenomination(50000)" id="denomination50000">50k</button><br><br>
                    <button type="button" onclick="selectDenomination(100000)" id="denomination100000">100k</button>
                    <button type="button" onclick="selectDenomination(200000)" id="denomination200000">200k</button>
                    <button type="button" onclick="selectDenomination(500000)" id="denomination500000">500k</button>
                    <input type="hidden" id="denomination" name="denomination">
                </div>
                <br>
                <h3>Choose quantity</h3>
                <label for="quantity">Quantity:</label>
                <input type="number" id="quantity" value="1" name="quantity" min="1" required="">
                <br><br>

            </div>
        </center>
        <br><br>
        <script>
            function selectDenomination(value) {
                var denominationButtons = document.querySelectorAll('.denomination-btns button');
                for (var i = 0; i < denominationButtons.length; i++) {
                    denominationButtons[i].classList.remove('active');
                }
                document.getElementById('denomination').value = value;
                var selectedButton = document.getElementById('denomination' + value);
                selectedButton.classList.add('active');
            }
            function selectSupplier(supplierId) {
                var supplierImages = document.querySelectorAll('.supplier-btns img');
                var selectedImage = document.getElementById(supplierId);

                // Remove 'selected' class from all images
                supplierImages.forEach(function (img) {
                    img.classList.remove('selected');
                });

                // Add 'selected' class to the clicked image
                selectedImage.classList.add('selected');

                // Set the supplier value in the hidden input field
                document.getElementById('supplier').value = supplierId;
            }
        </script>
    </body>
</html>

