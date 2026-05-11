#!/bin/bash

echo "Creating RentEase Full Stack Project..."

mkdir rentease-rental-platform
cd rentease-rental-platform

# Root Files
touch README.md .gitignore package.json

# ================= CLIENT =================
mkdir client
cd client

npm create vite@latest . -- --template react

npm install

npm install react-router-dom axios react-icons
npm install -D tailwindcss postcss autoprefixer

npx tailwindcss init -p

mkdir -p src/{assets,components,pages,layouts,context,services,hooks,routes,utils}

touch src/components/Navbar.jsx
touch src/components/Footer.jsx
touch src/pages/Home.jsx
touch src/pages/Login.jsx
touch src/pages/Register.jsx
touch src/pages/Products.jsx
touch src/pages/ProductDetails.jsx
touch src/pages/Cart.jsx
touch src/pages/AdminDashboard.jsx
touch src/routes/AppRoutes.jsx

cd ..

# ================= SERVER =================
mkdir server
cd server

npm init -y

npm install express mongoose dotenv cors bcryptjs jsonwebtoken multer nodemon

mkdir -p config controllers middleware models routes utils uploads

touch server.js
touch .env

touch config/db.js

touch models/User.js
touch models/Product.js
touch models/Order.js
touch models/Rental.js

touch controllers/authController.js
touch controllers/productController.js
touch controllers/orderController.js

touch routes/authRoutes.js
touch routes/productRoutes.js
touch routes/orderRoutes.js

touch middleware/authMiddleware.js

cd ..

# ================= DOCS =================
mkdir docs

touch docs/PRD.md
touch docs/REPORT.md
touch docs/API_DOCS.md

# ================= GIT =================
git init

echo "node_modules/" >> .gitignore
echo ".env" >> .gitignore

git add .
git commit -m "Initial RentEase full stack setup"

echo "Project Setup Complete!"