# Database Schema

## Database Name

Raga_Meds_Analytics

---

## Tables

### 1. Categories

| Column | Description |
|---------|-------------|
| category_id | Unique category identifier |
| category_name | Medicine category |

---

### 2. Medicines

| Column | Description |
|---------|-------------|
| medicine_id | Unique medicine identifier |
| medicine_name | Medicine name |
| category_id | Category reference |
| cost_price | Purchase price |
| selling_price | Selling price |
| expiry_date | Medicine expiry date |

---

### 3. Customers

| Column | Description |
|---------|-------------|
| customer_id | Unique customer identifier |
| customer_name | Customer name |
| age | Customer age |
| gender | Gender |
| city | Customer city |

---

### 4. Sales

| Column | Description |
|---------|-------------|
| sale_id | Unique sale identifier |
| customer_id | Customer reference |
| sale_date | Date of sale |
| payment_method | Payment mode |
| total_amount | Total bill amount |

---

### 5. Sale Details

| Column | Description |
|---------|-------------|
| sale_detail_id | Unique sale detail identifier |
| sale_id | Sale reference |
| medicine_id | Medicine reference |
| quantity | Quantity sold |
| sub_total | Line item amount |

---

### 6. Inventory

| Column | Description |
|---------|-------------|
| inventory_id | Inventory identifier |
| medicine_id | Medicine reference |
| stock_quantity | Available stock |
| reorder_level | Minimum stock level |
| warehouse | Storage warehouse |

---

### 7. Suppliers

| Column | Description |
|---------|-------------|
| supplier_id | Supplier identifier |
| supplier_name | Supplier name |
| city | Supplier city |
| contact_number | Contact number |

---

### 8. Purchases

| Column | Description |
|---------|-------------|
| purchase_id | Purchase identifier |
| supplier_id | Supplier reference |
| purchase_date | Purchase date |
| total_amount | Purchase amount |

---

### 9. Purchase Details

| Column | Description |
|---------|-------------|
| purchase_detail_id | Purchase detail identifier |
| purchase_id | Purchase reference |
| medicine_id | Medicine reference |
| quantity | Quantity purchased |
| subtotal | Purchase line amount |

---

## Relationships

- Categories → Medicines (1:M)
- Medicines → Inventory (1:1)
- Customers → Sales (1:M)
- Sales → Sale Details (1:M)
- Medicines → Sale Details (1:M)
- Suppliers → Purchases (1:M)
- Purchases → Purchase Details (1:M)
- Medicines → Purchase Details (1:M)

---

## Total Tables

- Categories
- Medicines
- Customers
- Sales
- Sale Details
- Inventory
- Suppliers
- Purchases
- Purchase Details

**Total Tables : 9**