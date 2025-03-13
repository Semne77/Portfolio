# SQL Database Project - Sales & Orders Management  

## 📌 Project Description  
This project involves designing and implementing a **relational database** to manage **sales representatives, customers, orders, products, discounts, and shipments**. The database efficiently tracks order details, manages relationships between sales reps and customers, and ensures data integrity through **primary and foreign key constraints**.

## 📁 Entity-Relationship (ER) Diagram  
The ER Diagram visually represents the relationships between tables. The key entities include:  
✔ **Customers** - Stores customer details and contact information.  
✔ **Sales Representatives** - Tracks sales reps and their assigned territories.  
✔ **Orders** - Manages customer orders, including shipping methods and payment terms.  
✔ **Products** - Stores product descriptions and unit prices.  
✔ **Discounts** - Tracks various discount types and their applied percentages.  
✔ **Shipping Methods** - Defines different shipment options and associated costs.  

*(Refer to the ER diagram image for an overview of table relationships.)*  

## 📌 Database Schema  

### **1️⃣ Customers & Sales Representatives**  
- `customers`: Stores customer details including **billing & shipping address**.  
- `customer_contact`: Manages **contact phone numbers** for each customer.  
- `sales_rep`: Stores sales representatives' **first & last names**.  
- `sales_rep_contact`: Holds **phone numbers and addresses** of sales reps.  
- `sales_rep_territory`: Establishes relationships between **sales reps and their territories**.  

### **2️⃣ Orders & Shipments**  
- `orders`: Stores order details including **payment due date, delivery date, and shipping method**.  
- `customer_address`: Tracks customer **billing & shipping addresses**.  
- `ship_method`: Defines **shipping methods** and their **cost ratios**.  

### **3️⃣ Products & Discounts**  
- `products`: Maintains a catalog of **product descriptions and unit prices**.  
- `discounts`: Stores different **discount types and percentage values**.  
- `order_details`: Connects **orders with products**, tracks **quantities, prices, and applied discounts**.  

## 🛠 Database Setup  

### **🔹 Prerequisites**  
Ensure you have **MySQL** or **PostgreSQL** installed.  

### **🔹 Installation Steps**  
1. **Clone the repository**  
   ```bash
   git clone https://github.com/your-repo/sql-database-project.git
   cd sql-database-project
