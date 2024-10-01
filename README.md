# Ecommerce

## overview

This project aims to create a robust and user-friendly e-commerce shopping portal. It will leverage modern technologies and best practices to provide a seamless shopping experience.

**Tech stacks**: [.NET](https://dotnet.microsoft.com/en-us/learn/dotnet/what-is-dotnet), [Angular](https://angular.io/docs), [MS SQL](https://learn.microsoft.com/en-us/sql/sql-server/tutorials-for-sql-server-2016?view=sql-server-ver16), [MongoDB](https://www.mongodb.com/docs/), [AWS](https://docs.aws.amazon.com/), [Redis](https://redis.io/docs/latest/), [Kafka](https://kafka.apache.org/documentation/), [Docker](https://docs.docker.com/).

## Key Features

#### 1. User Authentication and Authorization:

- Users will be able to create accounts, log in, and manage their profiles.
- Role-based authentication will ensure secure access to different functionalities.

#### Product Catalog:

- A comprehensive product catalog will showcase a wide range of products with detailed descriptions, images, and pricing information.

#### Search Functionality:

- Users can easily search for products using keywords or filters.

#### Shopping Cart:

- Users can add items to their shopping cart, modify quantities, and view the total cost before proceeding to checkout.

#### Checkout Process:

- A secure and efficient checkout process will guide users through payment, shipping information, and order confirmation.

#### Payment Gateway Integration:

- The portal will integrate with a reliable payment gateway (e.g., Stripe) to facilitate secure online transactions.

#### Order Tracking:

- Users can track the status of their orders from placement to delivery.

#### Wishlist Functionality: (Optional)

- Users may have the option to create wishlists and save products for future purchases.

## Technical Stack

The application is built with **Angular** on the front-end and a **.NET 8 Web API** on the back-end.

### Database:

- **MSSQL** will be used for its ACID properties to store more structured data such as Account, Orders, Inventory data.
- **MongoDB** will be used for its flexibility and scalability in handling unstructured data such as Product catalog.

### Caching:

- **Redis** will be employed to cache frequently accessed data, improving performance and reducing load on the database.

### Authentication and Authorization:

- **JSON Web Tokens (JWT)** will be implemented for secure authentication and authorization using cookie Authentication.

### Search:

- **Elastic Search** will be integrated to enable efficient product searching.

### Asynchronous Processing:

- **Apache Kafka** will be used for asynchronous processing of tasks like order creation, notifications, and background jobs.

### Containerization:

- **Docker** will be utilized to package the application and its dependencies into containers for easy deployment and management.

## Application Flow

#### User Registration/Login:

- Users can create new accounts or log in using their existing credentials.

#### Product Discovery:

- Users can browse the product catalog, search for specific items, and view product details.

#### Adding to Cart:

- Users can add products to their shopping cart and modify quantities.

#### Checkout:

- Users proceed to checkout, providing shipping and payment information.

#### Payment Processing:

- The payment gateway handles the transaction, and the order status is updated accordingly.

#### Order Confirmation:

- Users receive an order confirmation email with details and tracking information.

#### Order Tracking:

- Users can track the status of their order until delivery.

#### Note:

- This is a high-level overview of the project. The specific implementation details may vary based on project requirements and constraints.

### Additional Features (Optional)

#### Recommendations:

- Implement a recommendation system to suggest products based on user preferences and purchase history.

#### Reviews and Ratings:

- Allow users to leave reviews and ratings for products.

#### Social Media Integration:

- Integrate with social media platforms to enable user sharing and login options.

#### Mobile App:

- Develop a mobile app for a more convenient shopping experience.
