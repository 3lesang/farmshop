export const getCartItems = () => {
	const cartItems = localStorage.getItem('cartItems')
		? JSON.parse(localStorage.getItem('cartItems'))
		: [];
	return cartItems;
};
export const setCartItems = (cartItems) => {
	localStorage.setItem('cartItems', JSON.stringify(cartItems));
};
export const setUserInfo = ({
	id = '',
	full_name = '',
	username = '',
	pw = '',
	token = '',
	isAdmin = 0,
}) => {
	localStorage.setItem(
		'userInfo',
		JSON.stringify({
			id,
			full_name,
			username,
			pw,
			isAdmin,
			token,
		})
	);
};
export const clearUser = () => {
	localStorage.removeItem('userInfo');
};
export const getUserInfo = () => {
	return localStorage.getItem('userInfo')
		? JSON.parse(localStorage.getItem('userInfo'))
		: { full_name: '', username: '', pw: '' };
};
// export const getShipping = () => {
// 	const shipping = localStorage.getItem('shipping')
// 		? JSON.parse(localStorage.getItem('shipping'))
// 		: {
// 				address: '',
// 				city: '',
// 				postalCode: '',
// 				country: '',
// 		  };
// 	return shipping;
// };
// export const setShipping = ({
// 	address = '',
// 	city = '',
// 	postalCode = '',
// 	country = '',
// }) => {
// 	localStorage.setItem(
// 		'shipping',
// 		JSON.stringify({ address, city, postalCode, country })
// 	);
// };

// export const getPayment = () => {
// 	const payment = localStorage.getItem('payment')
// 		? JSON.parse(localStorage.getItem('payment'))
// 		: {
// 				paymentMethod: 'paypal',
// 		  };
// 	return payment;
// };
// export const setPayment = ({ paymentMethod = 'paypal' }) => {
// 	localStorage.setItem('payment', JSON.stringify({ paymentMethod }));
// };
// export const cleanCart = () => {
// 	localStorage.removeItem('cartItems');
// };
