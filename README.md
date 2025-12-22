# 🍳 Food App (Flutter)

A complete meal filtering and selection app built with Flutter. This application allows users to browse varied food categories, view recipe details, filter meals based on dietary restrictions (Gluten-free, Vegan, etc.), and save their favorite dishes.

## ✨ Features

* **Multi-Screen Navigation:** Seamless transition between Categories, Meal Details, and Filters using the Navigation Stack and Drawers.
* **Dynamic Filtering:** Users can filter recipes based on specific dietary needs:
    * Gluten-free
    * Lactose-free
    * Vegan
    * Vegetarian
* **Favorites System:** Mark meals as favorites to access them quickly from a dedicated tab.
* **Tab-Based Layout:** Persistent bottom navigation bar to switch between Categories and Favorites instantly.
* **Adaptive UI:** Responsive Grid and List views that adapt to content size.

## 🛠️ Tech Stack & Key Widgets

I built this project using **Flutter** and **Dart**, focusing on a component-driven architecture. Here are some of the key widgets and techniques I implemented:

### Navigation & Structure
* **`Scaffold`**: Used as the base structure for all screens, managing AppBars, Drawers, and BottomNavigationBars.
* **`TabsScreen` (State Management)**: Implemented the "Lifted State Up" pattern here. This screen acts as the central controller, managing the state for selected filters and favorite meals across the entire app.
* **`Drawer`**: A custom side-navigation menu for accessing the Filters screen.
* **`PopScope`**: Implemented manual back-navigation control in the Filters screen to ensure user preferences are saved and passed back correctly before closing the screen.

### Layout & Rendering
* **`GridView`**: Used in the Categories screen to create a responsive, tile-based layout.
* **`ListView.builder`**: Optimized rendering for the Meals list to handle dynamic lists of data efficiently.
* **`Stack`**: Used in meal cards to overlay text on top of images legibly.
* **`InkWell`**: Wrapped interactive elements to provide Material Design ripple effects on tap.

### Interactive Elements
* **`SwitchListTile`**: Used in the Filters screen to provide an intuitive toggle interface for dietary restrictions.
* **`BottomNavigationBar`**: Managed index switching for the main app tabs.

## 🚀 How to Run

1.  **Clone the repository**
    ```bash
    git clone [https://github.com/mhmadabuzaid/Food_App.git](https://github.com/mhmadabuzaid/Food_App.git)
    ```

2.  **Install dependencies**
    ```bash
    flutter pub get
    ```

3.  **Run the app**
    ```bash
    flutter run
    ```

## 📂 Project Structure

* `lib/models/`: Data blueprints (Meal, Category).
* `lib/screens/`: Full-page views (Categories, Meals, Filters, Tabs).
* `lib/widgets/`: Reusable UI components (MealItem, CategoryGridItem, MainDrawer).
* `lib/data/`: Dummy data source for testing UI logic.

---

