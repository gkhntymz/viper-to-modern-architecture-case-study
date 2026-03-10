# VIPER → Modern iOS Architecture Case Study

A production-style case study demonstrating how to evolve a legacy **VIPER module** into a modern, scalable iOS architecture.

This repository is **not about proving that VIPER is bad**.  
It is about understanding **trade-offs, coupling, and modernization strategy**.

```
VIPER (Legacy)
      ↓
Coordinator
      ↓
Remove Router
      ↓
Dependency Injection
      ↓
Async/Await
      ↓
Modern Modular Architecture
```

---

# 🎯 Goal

This project demonstrates how to:

- Analyze legacy architecture
- Identify structural coupling
- Introduce modern patterns safely
- Migrate incrementally (not rewrite blindly)
- Improve testability & maintainability
- Apply modern Swift Concurrency

This is the type of architectural thinking expected at **Senior / Staff / Principal iOS engineering levels**.

---

# 🧭 Architecture Evolution Timeline

This repository evolves **step-by-step**.  
Each commit represents a real architectural transition.

```
01 - Baseline (Broken / Legacy VIPER)
02 - Problems (Pain Points)
03 - Refactor Step 1 – Introduce Coordinator
04 - Refactor Step 2 – Remove Router
05 - Refactor Step 3 – Introduce Dependency Injection
06 - Refactor Step 4 – Async/Await Migration
07 - Final Modern Modular Architecture
```

The goal is to demonstrate **how real codebases evolve**, not how greenfield architectures are designed.

```
Legacy VIPER
      ↓
Coordinator Layer
      ↓
Feature Isolation
      ↓
Modern Architecture
```

---

# 📦 Phase 01 — Baseline (Legacy VIPER)

The project starts with a fully implemented **legacy VIPER login module**.

Typical structure:

```
SceneDelegate → ModuleBuilder → Router → ViewController
```

VIPER responsibilities:

- **ViewController** → UI
- **Presenter** → presentation logic
- **Interactor** → business logic
- **Router** → navigation
- **ModuleBuilder** → dependency assembly

While this structure enforces separation, it also introduces **significant indirection and boilerplate** for relatively small features.

---

# ⚠️ Phase 02 — Problems (Pain Points)

Before refactoring, we analyze the architectural limitations.

### Over-Fragmentation

A simple login screen requires multiple files:

- ViewController
- Presenter
- Interactor
- Router
- Contracts
- Entity
- ModuleBuilder

This increases cognitive overhead and slows down feature development.

---

### Router-Owned Navigation

Navigation is controlled by feature-level routers.

This becomes problematic when:

- coordinating multi-feature flows
- managing deep links
- enforcing app-level navigation policies

---

### Dependency Composition Complexity

Dependencies are implicitly created inside feature modules.

This leads to:

- hidden dependency graphs
- difficult testing
- environment configuration issues

---

### Protocol Explosion

Strict VIPER often leads to excessive protocols that add abstraction cost without improving flexibility.

---

### Callback-Based Async Flow

Legacy code often relies on nested completion handlers:

```
Presenter → Interactor → completion handler → DispatchQueue.main.async
```

As complexity grows, this becomes harder to maintain.

---

# 🔧 Phase 03 — Introduce Coordinator

The first refactor introduces an **AppCoordinator**.

Responsibility for application startup and root navigation moves from the feature layer to the **application layer**.

Before:

```
SceneDelegate → ModuleBuilder → Router
```

After:

```
SceneDelegate → AppCoordinator → LoginModuleBuilder
```

### Benefits

- Navigation begins moving out of feature modules
- App-level flow orchestration becomes explicit
- Foundation for removing routers

---

# 🔧 Phase 04 — Remove Router

The next refactor removes the feature-level `LoginRouter`.

Previously:

```
ViewController → Presenter → Router
```

After the refactor:

```
ViewController → Presenter → AppCoordinator
```

### Changes

- Removed `LoginRouter`
- Presenter no longer depends on router
- Navigation events exposed via closure
- `AppCoordinator` handles navigation

### Result

- fewer files
- simpler feature modules
- centralized navigation orchestration

---

# 🔧 Phase 05 — Introduce Dependency Injection

Originally, feature modules implicitly created their own dependencies.

Example:

```
Interactor → internally creates services
```

This makes testing difficult and tightly couples features to implementation details.

### Refactor

Dependencies are now injected from the **application layer**.

Changes:

- Introduced `AuthService` protocol
- Added `DefaultAuthService`
- `LoginInteractor` now receives dependencies via initializer
- `LoginModuleBuilder` no longer constructs services
- `AppCoordinator` owns dependency creation

### Result

Dependency ownership moves from feature modules to the **application layer**.

Benefits:

- improved testability
- explicit dependency graph
- better scalability

---

# ⚡ Phase 06 — Async/Await Migration

The login flow is modernized using **Swift Concurrency**.

Previously:

```
Presenter → Interactor → completion handler → DispatchQueue.main.async
```

Now:

```
Presenter → Task → await Interactor.login()
```

### Improvements

- linear execution flow
- cleaner error handling
- less callback nesting
- explicit UI updates via `MainActor`

---

# 🚀 Final Phase — Modern Modular Architecture

The final architecture demonstrates:

- Coordinator-based navigation
- Dependency injection
- Async-first service layer
- Reduced boilerplate
- Scalable feature modules
- Clear responsibility boundaries

---

# 📊 Why This Matters

Many production iOS codebases:

- started with VIPER
- grew over years
- now struggle with complexity

The real engineering challenge is:

> **How do you modernize architecture without rewriting everything?**

This repository documents that journey.

---

# 🧠 Intended Audience

- Senior iOS Engineers  
- Staff Engineers  
- Mobile Tech Leads  
- Architecture reviewers  
- Hiring managers  

---

# 🛠 Tech Stack

- Swift  
- UIKit  
- VIPER (legacy baseline)  
- Coordinator Pattern  
- Dependency Injection  
- Async/Await  
- Clean Architecture principles  

---

# 📁 Project Structure

```
App/
LegacyVIPER/
Shared/
```

---

# 📌 What This Is Not

- Not a VIPER tutorial  
- Not a beginner iOS project  
- Not a framework showcase  

It is an **architecture evolution case study**.

---

# License

MIT
