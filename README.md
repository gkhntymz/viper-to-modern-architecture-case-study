# VIPER → Modern iOS Architecture Case Study

A production-style case study demonstrating how to evolve a legacy VIPER module into a modern, scalable iOS architecture.

This repository is not about proving that VIPER is bad.  
It is about understanding **trade-offs, coupling, and modernization strategy**.

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

---

# 🎯 Goal

Show how to:

- Analyze legacy architecture
- Identify structural coupling
- Introduce modern patterns safely
- Migrate incrementally (not rewrite blindly)
- Improve testability & maintainability
- Apply modern Swift Concurrency

This is the type of architectural thinking expected at **Senior / Staff / Principal iOS levels**.

---

# 🧭 Architecture Evolution Timeline

This repository evolves step-by-step.

Each commit represents a real architectural transition.

01 - Baseline (Broken / Legacy VIPER)
02 - Problems (Pain Points)
03 - Refactor Step 1 – Introduce Coordinator
04 - Refactor Step 2 – Remove Router
05 - Refactor Step 3 – Introduce Dependency Injection
06 - Refactor Step 4 – Async/Await Migration
07 - Final Modern Modular Architecture

The goal is to demonstrate **how real codebases evolve**, not how greenfield architectures are designed.

Legacy VIPER
        ↓
Coordinator Layer
        ↓
Feature Isolation
        ↓
Modern Architecture

---

# 📦 Phase 01 – Baseline (Legacy VIPER)

The project starts with a fully implemented legacy VIPER login module.

Structure:

SceneDelegate → ModuleBuilder → Router

After:

SceneDelegate → AppCoordinator → LoginModuleBuilder

Benefits:

- Navigation begins moving out of feature modules
- App-level flow orchestration becomes explicit
- Foundation for removing routers

---

# 🔧 Phase 04 – Refactor Step 2 (Remove Router)

The next refactor removes the feature-level `LoginRouter`.

In the legacy VIPER structure, navigation was owned by the router:

```text
ViewController → Presenter → Router

# 🚀 Next Steps (Upcoming Refactors)

The next phases progressively modernize the architecture.

### Step 2 – Remove Router

Navigation will move completely to coordinators.

This simplifies feature modules and removes unnecessary routing layers.

---

### Step 3 – Introduce Dependency Injection

Replace ModuleBuilder-based wiring with a more structured dependency composition approach.

Goals:

- easier testing
- explicit dependency graph
- better scalability

---

### Step 4 – Async/Await Migration

Modernize async workflows using Swift Concurrency.

Replace:

completion handlers

with

This improves:

- readability
- structured concurrency
- cancellation support

---

### Final Phase – Modern Modular Architecture

End state will demonstrate a modern architecture with:

- Coordinator-based navigation
- Clear dependency injection
- Async-first service layer
- Reduced boilerplate
- Scalable feature modules

---

# 📊 Why This Matters

Many production iOS codebases:

- Started with VIPER
- Grew over years
- Now struggle with complexity

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
- MVVM (migration direction)
- Async/Await
- Clean architecture principles

---

# 📁 Project Structure

App/
LegacyVIPER/
Shared/

App/
LegacyVIPER/
Shared/

---

# 📌 What This Is Not

- Not a VIPER tutorial
- Not a beginner iOS project
- Not a framework showcase

It is an **architecture evolution case study**.

---

# License

MIT
