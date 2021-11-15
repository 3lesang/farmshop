import HomeScreen from './screens/HomeScreen.js';
import ProductScreen from './screens/ProductScreen.js';
import CartScreen from './screens/CartScreen.js';
import LoginScreen from './screens/LoginScreen.js';
import RegisterScreen from './screens/RegisterScreen.js';
import ProfileScreen from './screens/ProfileScreen.js';
import ShippingScreen from './screens/ShippingScreen.js';
import PaymentScreen from './screens/PaymentScreen.js';
import PlaceOrderScreen from './screens/PlaceOrderScreen.js';
import OrderScreen from './screens/OrderScreen.js';
import DashboardScreen from './screens/DashboardScreen.js';
import ProductListScreen from './screens/ProductListScreen.js';
import ProductEditScreen from './screens/ProductEditScreen.js';
import UserListScreen from './screens/UserListScreen.js';
import OrderListScreen from './screens/OrderListScreen.js';

export const routes = {
	'/': HomeScreen,
	'/product/:id/edit': ProductEditScreen,
	'/product/:id': ProductScreen,
	'/order/:id': OrderScreen,
	'/cart/:id': CartScreen,
	'/cart': CartScreen,
	'/login': LoginScreen,
	'/register': RegisterScreen,
	'/profile': ProfileScreen,
	'/shipping': ShippingScreen,
	'/payment': PaymentScreen,
	'/placeorder': PlaceOrderScreen,
	'/dashboard': DashboardScreen,
	'/productlist': ProductListScreen,
    '/userlist': UserListScreen,
	'/orderlist': OrderListScreen,
};
