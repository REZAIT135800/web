<?php 
     require_once("core/product-manager.php");
     require_once("core/resources.php");
     require_once("core/utilities.php");

     setPageTitle(SITE_TITLE);

     $productManager = new ProductManager();
     $products = $productManager->getAll();
     $productsCount = count($products);
?>



<?php require_once("header.php"); ?>

        <!-- search box section -->
        <section class="search-box-container">
            <div class="search-box">
                <form action="search.php" method="GET">
                    <input type="search" placeholder="<?php echo SEARCH; ?>" name="keyword" class="text-box">
                    <button><i class="fa fa-search fa-lg"></i></button>
                </form>
            </div>
        </section>

        <!-- caption -->
        <section class="main-content-caption">
            <h2><?php echo PRODUCTS_LIST.' ( '.$productsCount.' )'; ?></h2>
        </section>

        <!-- products grid list -->
        <section class="main-content">

        <?php       
            // create items
            foreach($products as &$product) {     
                $addToCartArgs = $product["product_id"].', \''.$product['caption'].'\', '.$product['price'].', \''.$product['image_url'].'\', '.$product['quantity'];
                $isProductAvailable = intval($product["quantity"]) > 0;
                $buttonStatus = $isProductAvailable ? '' : 'disabled';

                echo '<div class="card">';

                if (!$isProductAvailable) {
                    echo '<span class="quantity-status-label">ناموجود</span>';
                }

                echo '<a href="'.BASE_URL.'product-details.php?id='.$product["product_id"].'" class="item-link">';
                echo '<img src="'.$product["image_url"].'">';
                echo '<h1>'.$product["caption"].'</h1>';
                echo '<p class="price">'.$product["price"].'</p> ';
                echo '</a>';
                echo '<button class="secondary-button" '.$buttonStatus.' onClick="addToCart('.$addToCartArgs.')">'.ADD_TO_BASKET.'</button>';
                echo '</div>';
            }
        ?>       
            
        </section>

<?php require_once("footer.php"); ?>