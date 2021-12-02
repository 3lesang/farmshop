import { apiUrl } from '../conf.js';
import { getUserInfo } from '../localStorage.js';

export const getUsers = async ({ searchKeyword = '' }) => {
    try {
        const { token } = getUserInfo();
        let queryString = '?';
        if (searchKeyword) queryString += `q=${searchKeyword}`;
        const url = `${apiUrl}/users${queryString}`;
        const response = await fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${token}`,
            },
        });
        const users = await response.json();
        if (response.statusText !== 'OK') {
            throw new Error(response.Error);
        }
        return users;
    } catch (err) {
        console.log(err);
        return { error: err.Error || err.message };
    }
};

export const getUser = async (id) => {
    try {
        const { token } = getUserInfo();
        const url = `${apiUrl}/users/${id}`;
        const response = await fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${token}`,
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

export const updateUser = async ({ full_name, username, pw }) => {
    try {
        const { id, token } = getUserInfo();
        const url = `${apiUrl}/users`;
        const response = await fetch(url, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${token}`,
            },
            body: JSON.stringify({
                id,
                full_name,
                username,
                pw,
            }),
        });
        if (response.statusText !== 'OK') {
            throw new Error(response.Error);
        }
        const data = await response.json();
        return data;
    } catch (err) {
        console.log(err);
        return { error: err.message };
    }
};

export const deleteUser = async (userId) => {
    try {
        const { token } = getUserInfo();

        const url = `${apiUrl}/users/${userId}`;
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