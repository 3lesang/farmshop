import { apiUrl } from '../conf.js';
import { getUserInfo } from '../localStorage.js';
export const createOrder = async (order) => {
    try {
        const url = `${apiUrl}/orders`;
        const { token } = getUserInfo();
        const response = await fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${token}`,
            },
            body: JSON.stringify(order),
        });
        if (response.statusText !== 'OK') {
            throw new Error(response.Error);
        }
        return response.data;
    } catch (err) {
        return { error: err.message };
    }
};
export const getOrders = async () => {
    try {
        const url = `${apiUrl}/orders`;
        const { token } = getUserInfo();
        const response = await fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${token}`,
            },
        });
        if (response.statusText !== 'OK') {
            throw new Error(response.data.message);
        }
        const data = await response.json();
        return data;
    } catch (err) {
        console.log(err);
        return { error: err.response.data.message || err.message };
    }

};
export const deleteOrder = async (orderId) => {
    try {
        const url = `${apiUrl}/orders/${orderId}`;
        const { token } = getUserInfo();
        const response = await fetch(url, {

            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json',
                Authorization: `Bearer ${token}`,
            },
        });
        if (response.statusText !== 'OK') {
            throw new Error(response.data.message);
        }
        const data = await response.json();
        return data;
    } catch (err) {
        return { error: err.response.data.message || err.message };
    }
};
export const getOrder = async (id) => {
    try {
        const url = `${apiUrl}/orders/${id}`;
        const { token } = getUserInfo();
        const response = await fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${token}`,
            },
        });
        if (response.statusText !== 'OK') {
            throw new Error(response.data.message);
        }
        return response.data;
    } catch (err) {
        return { error: err.message };
    }
};
export const getMyOrders = async () => {
    try {
        const url = `${apiUrl}/orders/mine`;
        const { token } = getUserInfo();
        const response = await fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${token}`,
            },
        });
        if (response.statusText !== 'OK') {
            throw new Error(response.data.message);
        }
        const data = response.json();
        return data;
    } catch (err) {
        return { error: err.response ? err.response.data.message : err.message };
    }
};


export const getPaypalClientId = async () => {
    const url = `${apiUrl}/api/paypal/clientId`;
    const response = await fetch(url, {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json',
        },
    });
    if (response.statusText !== 'OK') {
        throw new Error(response.data.message);
    }
    return response.data.clientId;
};

export const payOrder = async (orderId, paymentResult) => {
    try {
        const url = `${apiUrl}/api/orders/${orderId}/pay`;
        const { token } = getUserInfo();
        const response = await fetch(url, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${token}`,
            },
            body: JSON.stringify(vpaymentResult)
        });
        if (response.statusText !== 'OK') {
            throw new Error(response.data.message);
        }
        return response.data;
    } catch (err) {
        return { error: err.response ? err.response.data.message : err.message };
    }
};
export const deliverOrder = async (orderId) => {
    try {
        const url = `${apiUrl}/api/orders/${orderId}/deliver`;
        const { token } = getUserInfo();
        const response = await fetch(url, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${token}`,
            },
        });
        if (response.statusText !== 'OK') {
            throw new Error(response.data.message);
        }
        return response.data;
    } catch (err) {
        return { error: err.response ? err.response.data.message : err.message };
    }
};