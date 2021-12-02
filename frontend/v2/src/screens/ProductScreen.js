import {
	parseRequestUrl,
	showLoading,
	hideLoading,
	showMessage,
	rerender,
} from '../utils.js';
// import { createReview, getProduct } from '../api/product.js';
import { getProduct } from '../api/product.js';
import Rating from '../components/Rating.js';
import { getUserInfo } from '../localStorage.js';
const navLink = document.querySelectorAll('a');
const header = document.querySelector('header');

const ProductScreen = {
	after_render: () => {
		const request = parseRequestUrl();
		document.getElementById('add-button').addEventListener('click', () => {
			document.location.hash = `/cart/${request.id}`;
		});

		// if (document.getElementById('review-form')) {
		// 	document
		// 		.getElementById('review-form')
		// 		.addEventListener('submit', async (e) => {
		// 			e.preventDefault();
		// 			showLoading();
		// 			const data = await createReview(request.id, {
		// 				comment: document.getElementById('comment').value,
		// 				rating: document.getElementById('rating').value,
		// 			});
		// 			hideLoading();
		// 			if (data.error) {
		// 				showMessage(data.error);
		// 			} else {
		// 				showMessage('Review Added Successfully', () => {
		// 					rerender(ProductScreen);
		// 				});
		// 			}
		// 		});
		// }
	},
	render: async () => {
		const request = parseRequestUrl();
		showLoading();
		const product = await getProduct(request.id);
        //console.log(product);
		if (product.error) {
			return `<div>${product.error}</div>`;
		}
		hideLoading();
		const userInfo = getUserInfo();
		return `
    

    <div class="container">
    <div class="row">
        <!-- Image -->
        <div class="col-12 col-lg-6">
            <div class="card bg-light mb-3">
                <div class="card-body">
                    <a href="" data-toggle="modal" data-target="#productModal">
                        <img class="img-fluid" src="${product.image_display}" />
                        
                    </a>
                </div>
            </div>
        </div>

        <!-- Add to cart -->
        <div class="col-12 col-lg-6 add_to_cart_block">
            <div class="card bg-light mb-3">
                <div class="card-body">
                  <h1><strong>${product.name}</strong></h1>
                  <p> <hr></p>
                    <p class="price">Price: ${product.price} VNĐ</p>
                    
                    <div>
                    Status : 
                    ${product.countInStock > 0		? `<span class="success">In Stock</span>`	: `<span class="error">Unavailable</span>`}
                  </div>
                  
                  
                  <label><strong>Quantity </strong> :</label>   
                        </div>
                        <div class="form-group">
                            
                            <div class="input-group mb-3">
                            <div class="input-group-prepend">
                            <button type="button" class="quantity-left-minus btn btn-danger btn-number"  data-type="minus" data-field="">
                                <i class="fa fa-minus"></i>
                            </button>
                        </div>
                        <input type="text" class="form-control"  id="quantity" name="quantity" min="1" max="100" value="1">
                        <div class="input-group-append">
                            <button type="button" class="quantity-right-plus btn btn-success btn-number" data-type="plus" data-field="">
                                <i class="fa fa-plus"></i>
                            </button>
                                </div>
                            </div>
                        </div>
                       
                       
                        <button id="add-button" class="fw primary">Add to Cart </div>
                    <form method="get" action="cart.html">
                        <div class="form-group">
                    </form>
                    <div class="product_rassurance">
                        <ul class="list-inline">
                            <li class="list-inline-item"><i class="fa fa-truck fa-2x"></i><br/>Fast delivery</li>
                            <li class="list-inline-item"><i class="fa fa-credit-card fa-2x"></i><br/>Secure payment</li>
                            <li class="list-inline-item"><i class="fa fa-phone fa-2x"></i><br/>+84 123 456 789</li>
                        </ul>
                    </div>
                    <div class="reviews_product p-3 mb-2 ">
                        3 reviews
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        (4/5)
                        <a class="pull-right" href="#reviews">View all reviews</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Description -->
    <div class="row">
        <div class="col-12">
            <div class="card border-light mb-3">
                <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-align-justify"></i> Description</div>
                <div class="card-body">
                    <p class="card-text">
                    ${product.detail}
                    </p>
                   
                </div>
            </div>
        </div>
    </div>
    <div class="content">
      <h2>Reviews</h2>
      ${
			/*product.reviews.length === 0 ? `<div>There is no review.</div>` : ''*/ ''
		}  
      <ul class="review">
      ${
			/*product.reviews
			.map(
				(review) =>
					`<li>
            <div><b>${review.name}</b></div>
            <div class="rating-container">
            ${Rating.render({
				value: review.rating,
			})}
              <div>
              ${review.createdAt.substring(0, 10)}
              </div>
            </div>
            <div>
            ${review.comment}
            </div>
          </li>`
			)
    .join('\n')*/ ''
		}

        <li>
       
        ${
			userInfo.name
				? `
            <div class="form-container">
            <form id="review-form">
              <ul class="form-items">
              <li> <h3>Write a customer reviews</h3></li>
                <li>
                  <label for="rating">Rating</label>
                  <select required name="rating" id="rating">
                    <option value="">Select</option>
                    <option value="1">1 = Poor</option>
                    <option value="2">2 = Fair</option>
                    <option value="3">3 = Good</option>
                    <option value="4">4 = Very Good</option>
                    <option value="5">5 = Excellent</option>
                  </select>
                </li>
                <li>
                  <label for="comment">Comment</label>
                  <textarea required  name="comment" id="comment" ></textarea>
                </li>
                <li>
                  <button type="submit" class="primary">Submit</button>
                </li>
              </ul>
            </form>
            </div>`
				: ` <div>
              Please <a href="/#/signin">Signin</a> to write a review.
            </div>`
		}
      </li>
    </ul> 

      </div>
      
    </div>

</div>`;
   
	},
};
export default ProductScreen;
