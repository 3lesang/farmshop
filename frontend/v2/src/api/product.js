import { apiUrl } from '../conf.js';
import { getUserInfo } from '../localStorage.js';

export const getProducts = async ({ searchKeyword = '' }) => {
	try {
		let queryString = '?';
		if (searchKeyword) queryString += `q=${searchKeyword}`;
		const url = `${apiUrl}/products${queryString}`;
		const response = await fetch(url, {
			method: 'GET',
			headers: {
				'Content-Type': 'application/json',
			},
		});
		const products = await response.json();
		if (response.statusText !== 'OK') {
			throw new Error(response.Error);
		}
		return products;
	} catch (err) {
		console.log(err);
		return { error: err.Error || err.message };
	}
};

export const getProduct = async (id) => {
	try {
		const url = `${apiUrl}/products/${id}`;
		const response = await fetch(url, {
			method: 'GET',
			headers: {
				'Content-Type': 'application/json',
			},
		});
		if (response.statusText !== 'OK') {
			throw new Error(response.Error);
		}
		const product = await response.json();
		return product;
	} catch (err) {
		console.log(err);
		return { error: err.message };
	}
};

export const createProduct = async () => {
	try {
		const { token } = getUserInfo();

		const url = `${apiUrl}/products`;
		const response = await fetch(url, {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
				'Authorization': `Bearer ${token}`,
			},
		});
		if (response.statusText !== 'OK') {
			throw new Error(response.Error);
		}
		const data = await response.json();
		return data;
	} catch (err) {
		return { error: err.message };
	}
};


export const updateProduct = async (product) => {
	try {
		const { token } = getUserInfo();

		const url = `${apiUrl}/products/${product.id}`;
		const response = await fetch(url, {
			method: 'PUT',
			headers: {
				'Content-Type': 'application/json',
				'Authorization': `Bearer ${token}`,
			},
			body: JSON.stringify(product),
		});
		if (response.statusText !== 'OK') {
			throw new Error(response.Error);
		}
		const data = await response.json();
		return data;
	} catch (err) {
		return { error: err.message };
	}
};

export const deleteProduct = async (productId) => {
	try {
		const { token } = getUserInfo();

		const url = `${apiUrl}/products/${productId}`;
		const response = await fetch(url, {
			method: 'DELETE',
			headers: {
				'Content-Type': 'application/json',
				'Authorization': `Bearer ${token}`,
			},
		});
		if (response.statusText !== 'OK') {
			throw new Error(response.Error);
		}
		return true;
	} catch (err) {
		return { error: err.message };
	}
};


export const uploadProductImage = async (formData) => {
	try {
		const { token } = getUserInfo();
        const url = `${apiUrl}/uploads`;
		const response = await fetch(url, {
			method: 'POST',
			headers: {
				'Authorization': `Bearer ${token}`,
				'Content-Type': 'multipart/form-data',
			},
			body: formData,
		});
		if (response.statusText !== 'OK') {
			throw new Error(response.Error);
		} else {
			return response.data;
		}
	} catch (err) {
		return { error: err.response.message || err.message };
	}
};