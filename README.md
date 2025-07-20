# Restaurant App 🍽️

A modern, feature-rich Flutter restaurant application with beautiful glassmorphism UI, interactive Rive animations, and comprehensive restaurant management features.

## ✨ Key Features

### 🎨 **Premium UI/UX Design**
- **Glassmorphism Theme** - Modern glass-effect design with elegant visual aesthetics
- **Interactive Rive Animations** - Smooth, engaging animations powered by Rive
- **Responsive Design** - Optimized for all screen sizes and orientations
- **Custom Navigation** - Intuitive side menu and tab bar navigation
- **Performance Optimized** - Efficient rendering with cached painters and optimized widgets

### 🍕 **Restaurant Core Features**

#### **Menu Management**
- **Digital Menu Display** - Browse restaurant menu with categorized items
- **Category Filtering** - Filter by: All, Appetizers, Main Course, Desserts, Beverages, Specials
- **Menu Item Cards** - Beautiful presentation with images, descriptions, and pricing
- **Search Functionality** - Quick search through menu items
- **Special Offers** - Highlight daily specials and promotional items

#### **Wallet & Payments**
- **Digital Wallet** - Integrated wallet system for seamless payments
- **Balance Management** - View current wallet balance ($125.50 default)
- **Transaction History** - Track all payment transactions
- **Multiple Payment Methods** - Support for various payment options
- **Secure Transactions** - Safe and encrypted payment processing

#### **User Profile**
- **Account Management** - Complete user profile customization
- **Personal Information** - Manage contact details and preferences
- **Order History** - View past orders and favorites
- **Settings & Preferences** - Customize app experience

#### **Customer Support**
- **Help Center** - Comprehensive help and FAQ section
- **Live Chat Support** - Real-time customer assistance
- **Restaurant Information** - Contact details and location info
- **Feedback System** - Rate and review restaurant services

### 🔐 **Authentication System**
- **Elegant Sign-In** - Beautiful animated sign-in interface
- **Multi-Platform Login** - Email, Apple, and Google authentication
- **Secure Authentication** - Safe user credential management
- **Animated Feedback** - Success/error animations with Rive
- **Password Security** - Secure password handling

### 🏠 **Home Dashboard**
- **Welcome Interface** - Personalized greeting and quick access
- **Restaurant Highlights** - Featured items and promotions
- **Quick Actions** - Fast access to popular features
- **Status Indicators** - Real-time updates and notifications

## 🛠️ **Technical Features**

### **Performance Optimizations**
- Cached background painters for smooth rendering
- Optimized widget rebuilds
- Efficient memory management
- Smooth 60fps animations

### **Interactive Components**
- Custom glass effect components
- Restaurant-themed icons and graphics
- Animated tab navigation
- Gesture-based interactions

### **Responsive Architecture**
- Clean MVVM architecture
- Modular component structure
- Reusable UI widgets
- Scalable codebase

## 📱 **Screens Overview**

| Screen | Description | Features |
|--------|-------------|----------|
| **Home** | Main dashboard | Quick navigation, featured content, restaurant highlights |
| **Menu** | Digital menu browser | Category filters, search, item details, pricing |
| **Wallet** | Payment management | Balance view, transactions, payment methods |
| **Profile** | User account | Personal info, settings, order history |
| **Help** | Customer support | FAQ, live chat, contact information |
| **Sign In** | Authentication | Email/social login, animated feedback |

## 🚀 **Getting Started**

### **Prerequisites**
- Flutter SDK (latest stable version)
- Dart SDK 
- Android Studio / VS Code with Flutter extensions
- Android device/emulator or iOS simulator

### **Installation Steps**

1. **Clone the repository:**
```bash
git clone https://github.com/RusthyAhd/Restuarant_App.git
```

2. **Navigate to project:**
```bash
cd "restuarant app"
```

3. **Install dependencies:**
```bash
flutter pub get
```

4. **Run the application:**
```bash
flutter run
```

### **Building for Production**

**Android APK:**
```bash
flutter build apk --release
```

**Android App Bundle:**
```bash
flutter build appbundle --release
```

**iOS (macOS only):**
```bash
flutter build ios --release
```

## 🏗️ **Project Architecture**

```
lib/
├── main.dart                      # Application entry point
├── ui/
│   ├── home.dart                 # Main home screen with dashboard
│   ├── theme.dart                # App-wide theme configuration
│   ├── assets.dart               # Asset path constants
│   ├── components/               # Reusable UI components
│   │   ├── glass_components.dart # Glassmorphism components
│   │   ├── restaurant_icons.dart # Custom restaurant icons
│   │   ├── vcard.dart           # Vertical card component
│   │   ├── hcard.dart           # Horizontal card component
│   │   └── menu_row.dart        # Menu item row component
│   ├── navigation/               # Navigation components
│   │   ├── custom_tab_bar.dart  # Bottom tab navigation
│   │   ├── home_tab_view.dart   # Tab view controller
│   │   └── side_menu.dart       # Slide-out side menu
│   ├── screens/                  # Main application screens
│   │   ├── menu_screen.dart     # Restaurant menu interface
│   │   ├── wallet_screen.dart   # Payment & wallet management
│   │   ├── profile_screen.dart  # User profile & settings
│   │   ├── help_screen.dart     # Customer support & help
│   │   ├── restaurant_dashboard.dart # Restaurant overview
│   │   └── restaurant_splash.dart    # Splash screen
│   ├── models/                   # Data models
│   │   ├── menu_item.dart       # Menu item structure
│   │   ├── menu_items.dart      # Menu data collection
│   │   ├── courses.dart         # Course categories
│   │   └── tab_item.dart        # Navigation tab structure
│   └── on_boarding/              # Authentication flow
│       ├── onboarding_view.dart # Welcome screens
│       └── signin_view.dart     # Sign-in interface
```

## 🎯 **Technology Stack**

- **Framework:** Flutter 3.x
- **Language:** Dart
- **Animations:** Rive
- **UI Design:** Material Design + Custom Glassmorphism
- **State Management:** StatefulWidget + Provider patterns
- **Architecture:** MVVM (Model-View-ViewModel)
- **Platform:** iOS, Android, Web (responsive)

## 🌟 **App Highlights**

- **Modern Design:** Glass-effect UI with smooth animations
- **User-Friendly:** Intuitive navigation and clean interface
- **Feature-Rich:** Complete restaurant management solution
- **Performance:** Optimized for smooth 60fps experience
- **Scalable:** Modular architecture for easy feature additions
- **Responsive:** Works seamlessly across all device sizes

## 🤝 **Contributing**

We welcome contributions! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 **License**

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 **Contact & Support**

- **Developer:** RusthyAhd
- **Repository:** [Restuarant_App](https://github.com/RusthyAhd/Restuarant_App)
- **Branch:** rusthy
- **Issues:** Report bugs and request features via GitHub Issues

---

*Built with ❤️ using Flutter & Dart* 
