# PocketWords

## Overview

PocketWords is a single-screen iOS app that enables users to create and review vocabulary flashcards. Cards flip on tap, accept typed answers, and track XP progress. All data persists locally with SwiftData.

## Features

* **Add Cards**: Modal sheet with “Word” and “Meaning” fields writes to SwiftData.
* **Flashcard Viewer**: 3D Y‑axis flip on tap; vertical scroll gesture to navigate between cards.
* **Answer Input**: TextField below each card compares trimmed, lowercased input and displays correct/incorrect feedback.
* **XP & Progress**: +10 XP per correct answer; ProgressView shows total correct out of total cards.

## Architecture

* MVVM pattern separates Views, ViewModels, and Repositories.
* Two data sources:

  * **Bundle JSON** (`Resources/initial_words.json`): seeds the database on first launch.
  * **SwiftData**: primary persistence layer for cards and XP.

## Project Structure

```
PocketWords/
├── AppUI/               # Reusable UI components (FlippableView, FlashCardView)
├── AppDomain/           # Business models and repository interfaces
├── Resources/           # FlashCards.json
└── Tests/               # Unit tests for ViewModel logic
```

## Gestures

* **Horizontal Swipe**: Swipe left or right to flip the card front/back.
* **Vertical Scroll**: Scroll up to advance to the next card; scroll down to return to the previous card.

## Build & Test

* Requires Xcode 16 targeting iOS 18.
* Build with `⌘B`, run with `⌘R`.
* Execute unit tests via `⌘U`.

## Trade-offs

* Initial JSON seeding avoids blocking UI but adds complexity on first launch.
* All persistence resides in SwiftData for consistency, seeding JSON only once.
