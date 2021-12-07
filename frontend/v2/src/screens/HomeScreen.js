import Rating from '../components/Rating.js';
import { getProducts } from '../api/product.js';
import { getImage_Sliders } from '../api/image_slider.js';
import { getCategory } from '../api/category.js';
import { parseRequestUrl } from '../utils.js';


const HomeScreen = {
    render: async () => {

        const { value } = parseRequestUrl();
        const products = await getProducts({ searchKeyword: value });
        if (products.error) {
            return `<div class="error">${products.error}</div>`;
        }

        const image_sliders = await getImage_Sliders({ searchKeyword: value });
        console.log(image_sliders);
        if (image_sliders.error) {
            return `<div class="error">${image_sliders.error}</div>`;
        }

        return `
        	
            <section class = "auto-slider" >
                <div id="slider">
					<figure>
					${image_sliders
						.map(
							(image_slider) => `
							<img src="${image_slider.file}" alt="Image">`
							)
							.join('\n')}
							
						'
					</figure>				
				</div> 
			</section>
                <div class="product-section">
                	<h1>Trái cây</h1>
                <ul class = "products" >
                ${
                    products
                        .map(
                            (product) => `
		  <li>
		    <div class="product">
		    <i class="fas fa-cart-plus cart-icon"></i>
		      <a href="/#/product/${product.code ? product.code : product.id}">
		        <img src="${product.image_display}" alt="${product.name}" />
		      </a>
		    <div class="product-name">
		      <a href="/#/product/${product.code ? product.code : product.id}">
		        ${product.name}
		      </a>
		    </div>
		    <div class="product-rating">
		      ${Rating.render({
					value: product.rating,
					text: `${product.numReviews} reviews`,
				})}
		    </div>
		    <div class="product-price">
            ${product.price} VNĐ
		    </div>

		    </div>
		  </li>
		  `
                        )
                        .join('\n')
                }
              </div>
              <div product-section>
              	
              </div>
            <footer>
				<div class="row">
				    <a href="#"><i class="fa fa-facebook"></i></a>
				    <a href="#"><i class="fa fa-instagram"></i></a>
				    <a href="#"><i class="fa fa-youtube"></i></a>
				    <a href="#"><i class="fa fa-twitter"></i></a>
				</div>
				<div class="row">
				    <ul>
				        <li><a href="#">Contact us</a></li>
				        <li><a href="#">Our Services</a></li>
				        <li><a href="#">Privacy Policy</a></li>
				        <li><a href="#">Terms & Conditions</a></li>
				        <li><a href="#">Career</a></li>
				    </ul>
				</div>
				<div class="row">
				    Copyright © 2021 Name- All rights reserved
				</div>
        </footer>`
    }

}
export default HomeScreen;