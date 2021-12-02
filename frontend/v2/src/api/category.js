import { apiUrl } from '../conf.js';
import { getUserInfo } from '../localStorage.js';

export const getCategories = async ({ searchKeyword = '' }) => {
    try {
        let queryString = '?';
        if (searchKeyword) queryString += `q=${searchKeyword}`;
        const url = `${apiUrl}/categories${queryString}`;
        const response = await fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
            },
        });
        const categories = await response.json();
        if (response.statusText !== 'OK') {
            throw new Error(response.Error);
        }
        return categories;
    } catch (err) {
        console.log(err);
        return { error: err.Error || err.message };
    }
};

export const getCategory = async (id) => {
    try {
        const url = `${apiUrl}/categories/${id}`;
        const response = await fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
            },
        });
        if (response.statusText !== 'OK') {
            throw new Error(response.Error);
        }
        const category = await response.json();
        return category;
    } catch (err) {
        console.log(err);
        return { error: err.message };
    }
};