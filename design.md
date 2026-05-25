# DevPaul Eats — Design Document

## Stack
- **Frontend**: Flutter (BLoC/Cubit + Freezed + get_it/injectable)
- **Backend**: Firebase (Auth + Firestore + Storage)
- **Navigation**: go_router
- **Error handling**: dartz (Either)

---

## Firestore Schema

```
users/{userId}
  name, email, role: "client"|"vendor", photoUrl, createdAt

vendors/{vendorId}
  userId, storeName, description, category, coverPhotoUrl
  rating, totalOrders, isOpen, createdAt
  └── menu_items/{itemId}
        name, description, basePrice, photoUrl
        category, isAvailable
        └── toppings/{toppingId}
              name, pricePerGram, minGrams, maxGrams, unit: "g"|"ml"

orders/{orderId}
  clientId, vendorId, status: "pending"|"accepted"|"preparing"|"ready"|"delivered"|"cancelled"
  items: [
    { menuItemId, menuItemName, basePrice, photoUrl,
      toppings: [{ toppingId, name, grams, pricePerGram }] }
  ]
  subtotal, total, note, createdAt, updatedAt

carts/{userId}   ← documento único por cliente
  vendorId, vendorName
  items: [ same structure as order items ]
```

---

## Clean Architecture Layers

```
lib/
  core/
    errors/          # Failure classes
    usecases/        # UseCase<Type, Params> base
    di/              # get_it + injectable setup
    theme/           # design tokens, typography
    router/          # go_router config
  features/
    auth/            # login, register, role selection
    vendors/         # marketplace feed + vendor detail
    menu/            # item detail + customization flow
    cart/            # cart management
    orders/          # order placement + status
    vendor_panel/    # vendor: menu CRUD + incoming orders
```

Each feature:
```
data/
  datasources/   # Firebase calls
  models/        # JSON serializable (freezed)
  repositories/  # implements domain repo
domain/
  entities/      # pure Dart (freezed)
  repositories/  # abstract
  usecases/      # single-responsibility
presentation/
  bloc/          # Cubit + States (freezed)
  pages/
  widgets/
```

---

## Key Domain Entities

```dart
// Vendor, MenuItem, Topping, CartItem, Order
// All with Freezed + copyWith + json serialization
```

---

## UI Design System

- **Palette**: Primary `#FF6B35` (orange), Accent `#D62828` (red), BG `#FFF8F0` (cream)
- **Grid**: 8pt
- **Typography**: Playfair Display (H1/H2) + Inter (body/labels)
- **Components**: VendorCard (hero img + rating), ItemCard, ToppingSlider, CartBadge

---

## Screens

### Client Flow
1. Splash → Auth (login/register + role)
2. Home → VendorList (search + category filter)
3. VendorDetail → menu por categoría
4. ItemCustomizer → base + toppings con Slider (g) + precio live
5. Cart → resumen + nota + total
6. OrderConfirm → success + tracking

### Vendor Flow
1. VendorPanel → dashboard (órdenes activas)
2. MenuManager → lista ítems + CRUD
3. ToppingManager → por ítem
4. OrderDetail → aceptar/rechazar/avanzar estado

---

## Design Patterns

- **Repository Pattern**: data ↔ domain boundary
- **Factory Pattern**: model → entity mapping
- **Observer**: BLoC streams
- **Singleton**: get_it registrations
- **Strategy**: pricing calculation (base + Σ(grams × pricePerGram))
