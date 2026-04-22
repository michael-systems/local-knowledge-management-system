# Data Model Overview

This document describes the core entities behind the Local Knowledge Management System.

The application is built as a local desktop knowledge workspace that combines documents, notes, search, structure, and tasks in one system.

## Core Entities

### 1. Documents
Indexed source materials imported from the active local library.

Supported formats in the current version:
- `.md`
- `.txt`
- `.docx`

Documents store:
- title
- file path
- content
- file type
- timestamps
- theme assignment
- favorite status

Purpose:
- serve as the main knowledge source layer
- support reading, search, and contextual linking

---

### 2. Notes
User-created notes written inside the application.

Notes store:
- title
- body
- timestamps
- pinned/favorite state
- theme assignment
- tag assignments
- linked documents

Purpose:
- capture thoughts, conclusions, plans, and context derived from documents

---

### 3. Themes
High-level semantic categories used to structure the knowledge base.

Examples:
- Work
- Finance
- Health
- English
- AI

Purpose:
- group documents and notes into larger meaning-based areas
- provide top-level structure beyond file storage

---

### 4. Tags
Lightweight labels used for more precise classification.

Examples:
- important
- draft
- reference
- useful
- check later

Purpose:
- support flexible filtering and fine-grained retrieval
- complement themes rather than replace them

---

### 5. Links
Explicit relationships between notes and documents.

Supported relationship:
- note ↔ document

Purpose:
- preserve context
- show which notes belong to which source materials
- reduce “orphan notes” with no traceable origin

---

### 6. Tasks
Action items created inside the application.

Tasks store:
- text
- due date
- priority
- completion state
- optional linked note
- optional linked document

Purpose:
- connect knowledge work to execution
- turn reading and note-taking into follow-up actions

---

### 7. Active Library
The currently selected local source folder used for indexing documents.

Purpose:
- keep each workspace tied to a specific document library
- avoid mixing unrelated knowledge bases into one flat dataset

---

### 8. Backups
The application stores internal state in a local SQLite database and supports backup / restore of that internal state.

Backed up data includes:
- notes
- tasks
- themes
- tags
- document metadata
- links
- library references
- app state

Not backed up:
- original source files themselves

Purpose:
- preserve the internal structure of the knowledge workspace
- make the system safe to trust for real use

---

## Relationship Summary

Main relationships inside the system:

- documents can belong to one theme
- notes can belong to one theme
- notes can have many tags
- documents can have many tags
- notes can link to many documents
- tasks can optionally point to a note
- tasks can optionally point to a document

This makes the system more than a file browser or note editor:
it becomes a structured local workflow for reading, writing, organizing, and acting on information.

---

## Architectural Note

The repository is published as a technical case study rather than a full production code dump.

Only safe, representative technical artifacts are exposed publicly.
