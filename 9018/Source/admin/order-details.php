<?php
require_once ("../core/resources.php");
require_once ("../core/utilities.php");
require_once ("../core/order-manager.php");
require_once ("../core/order-details-manager.php");
require_once ("../core/customer-manager.php");
require_once ("../core/product-manager.php");

if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

$sessionsState = isSessionExists("IsAuthorized") && getSession("IsAuthorized") == true;

if (!$sessionsState) {
    redirectTo(CONTROL_PANEL_LOGIN_URL);
}

$hasOrderId = isset($_GET["oid"]);

if ($hasOrderId) {
    $orderId = intval($_GET["oid"]);

    if ($orderId == 0) {
        redirectTo(NOT_FOUND_PAGE_URL);
    }

    $productManager = new ProductManager();
    $customerManager = new CustomerManager();
    $orderManager = new OrderManager();
    $orderDetailsManager = new OrderDetailsManager();

    $orderInfo = $orderManager->getById($orderId);

    if ($orderInfo->orderId <= 0) {
        redirectTo(NOT_FOUND_PAGE_URL);
    }

    $orderDetails = $orderDetailsManager->getByOrderId($orderInfo->orderId);
    $customerInfo = $customerManager->getById($orderInfo->customerId);
    $orderStatus = $orderInfo->paymentStatus == 1 ? SUCCESS : FAILED;
    $orderStatusSpanClass = $orderInfo->paymentStatus == 1 ? "success-payment" : "failed-payment";

} else {
    redirectTo(NOT_FOUND_PAGE_URL);
}
setPageTitle(ORDER_DETAILS_TITLE);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><?php echo $GLOBALS["CurrentPageTitle"]; ?></title>

    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.0.min.js"></script>
    <script src="http://cdn.ckeditor.com/4.6.2/standard-all/ckeditor.js"></script>
    <script src="js/script.js"></script>

</head>
<body>
    <script>
        // clear cart items
        localStorage.removeItem(localCartKey);
    </script>

    <section class="order-receipt-section">
        <div class="caption">
            <h1><?php echo ORDER_RECEIPT_CAPTION; ?></h1>
        </div>

        <div class="items">
            <table>
                <tbody>
                <tr class="list-header">
                    <th><?php echo ID; ?></th>
                    <th><?php echo IMAGE; ?></th>
                    <th><?php echo CAPTION; ?></th>
                    <th><?php echo CUSTOMER; ?></th>
                    <th><?php echo QUANTITY; ?></th>
                    <th><?php echo UNIT_PRICE; ?></th>
                    <th><?php echo TOTAL_PRICE; ?></th>
                    <th><?php echo DATE_TIME; ?></th>
                </tr>

                <?php
                foreach ($orderDetails as &$orderDetail) {
                    $productInfo = $productManager->getById($orderDetail['product_id']);
                    ?>
                    <tr>
                        <td><?php echo $orderDetail['details_id']; ?></td>
                        <td><img src="<?php echo $productInfo->imageUrl; ?>" alt="<?php echo $productInfo->caption; ?>"></td>
                        <td><?php echo $productInfo->caption; ?></td>
                        <td><?php echo $customerInfo->fullName; ?></td>
                        <td><?php echo $orderDetail['order_quantity']; ?></td>
                        <td><span class="price"><?php echo $orderDetail['product_price']; ?></span></td>
                        <td><span class="price"><?php echo intval($orderDetail['product_price']) * intval($orderDetail['order_quantity']); ?></span></td>
                        <td><?php echo $orderInfo->dateTime; ?></td>
                    </tr>
                <?php } ?>

                </tbody>
            </table>

            <div class="list-footer">
                <div class="details">
                    <div>
                        <span><?php echo TOTAL_QUANTITY; ?>: </span><span><?php echo $orderInfo->totalProducts; ?></span>
                    </div>

                    <div>
                        <span><?php echo PAID_PRICE; ?>: </span><span class="price"><?php echo $orderInfo->totalPrice; ?></span>
                    </div>

                    <div>
                        <span><?php echo ORDER_PAYMENT_STATUS; ?>: </span><span class="<?php echo $orderStatusSpanClass; ?>"><?php echo $orderStatus; ?></span>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>