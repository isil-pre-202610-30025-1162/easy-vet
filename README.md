# EasyVet

EasyVet es una aplicación móvil desarrollada con SwiftUI orientada a la gestión y visualización de productos veterinarios mediante una arquitectura modular basada en principios de Clean Architecture y MVVM.

La aplicación busca mantener una estructura escalable, organizada y fácil de mantener, separando responsabilidades por capas y features.

---

# Tecnologías utilizadas

- Swift
- SwiftUI
- MVVM
- URLSession
- Clean Architecture
- Arquitectura modular por Features

---

# Arquitectura utilizada

El proyecto utiliza una combinación de:

- **MVVM (Model - View - ViewModel)**
- **Clean Architecture**
- **Feature-Based Architecture**

La aplicación se organiza por funcionalidades (`Features`) y cada feature contiene sus propias capas internas.

---

# Estructura general del proyecto

```text
EasyVet
│
├── App
├── Core
├── Features
├── Resources
└── README.md
```

---

# App

La carpeta `App` contiene el punto de entrada y navegación principal de la aplicación.

```text
App
├── EasyVetApp.swift
└── MainView.swift
```

## Responsabilidades

### EasyVetApp.swift
Punto de inicio de la aplicación.

### MainView.swift
Contiene el `TabView` principal de la aplicación.

---

# Core

La carpeta `Core` contiene elementos reutilizables compartidos entre múltiples features.

```text
Core
├── Components
├── Theme
├── Navigation
├── Extensions
└── Utils
```

## Responsabilidades

### Components
Controles reutilizables:
- Botones
- TextFields
- Cards

### Theme
Configuración visual global:
- Colores
- Tipografías
- Espaciados
- Shapes

### Navigation
Manejo de navegación compartida.

### Extensions
Extensiones de Swift y SwiftUI.

### Utils
Funciones auxiliares y utilidades generales.

---

# Features

Cada feature representa una funcionalidad independiente de la aplicación.

```text
Features
├── Auth
├── Onboarding
├── Home
├── Favorites
├── Cart
└── Profile
```

Cada feature se divide en tres capas principales:

- Data
- Domain
- Presentation

---

# Capa Data

La capa `Data` es responsable del acceso y manipulación de datos.

```text
Data
├── DTOs
├── Services
├── Repositories
└── Local
```

## Responsabilidades

### DTOs
Representan la estructura exacta recibida desde APIs.

Ejemplo:

```swift
struct ProductDto: Decodable
```

### Services
Realizan el consumo de servicios web.

Ejemplo:
- URLSession
- Networking
- Requests HTTP

Los services trabajan únicamente con DTOs y no deberían conocer modelos de dominio.

### Repositories
Actúan como intermediarios entre:
- servicios remotos
- almacenamiento local
- capa de presentación

El repository transforma DTOs en modelos de dominio.

### Local
Contiene:
- persistencia local
- cache
- CoreData
- UserDefaults
- SQLite

---

# Capa Domain

La capa `Domain` contiene la lógica de negocio principal.

```text
Domain
├── Models
├── Repository
└── UseCases
```

## Responsabilidades

### Models
Modelos de negocio utilizados por la aplicación.

Ejemplo:

```swift
struct Product
```

Estos modelos no dependen de:
- APIs
- UI
- frameworks externos

### Repository
Contratos o protocolos que definen operaciones del dominio.

Ejemplo:

```swift
protocol ProductRepository
```

### UseCases
Contienen reglas de negocio específicas.

Ejemplo:
- Obtener productos
- Guardar favoritos
- Sincronizar información

En proyectos pequeños pueden omitirse para evitar sobreingeniería.

---

# Capa Presentation

La capa `Presentation` contiene todo lo relacionado a la interfaz de usuario.

```text
Presentation
├── Views
└── ViewModels
```

## Responsabilidades

### Views
Pantallas y componentes visuales desarrollados con SwiftUI.

Ejemplo:
- HomeView
- LoginView
- CartView

### ViewModels
Gestionan:
- estados de UI
- loading
- errores
- interacción con repositories

La vista nunca debería consumir directamente servicios web.

---

# Flujo arquitectónico

La comunicación normalmente sigue este flujo:

```text
View
↓
ViewModel
↓
Repository
↓
Service / Local DataSource
```

---

# Organización basada en Features

Cada módulo mantiene encapsulados:
- sus vistas
- modelos
- lógica
- servicios

Esto facilita:
- escalabilidad
- mantenimiento
- reutilización
- trabajo en equipo

---

# Características actuales

- Onboarding
- Login
- Catálogo de productos
- Detalle de productos
- Favoritos
- Carrito de compras
- Perfil de usuario

---

# Autor

Jorge Luis Mayta Guillermo
