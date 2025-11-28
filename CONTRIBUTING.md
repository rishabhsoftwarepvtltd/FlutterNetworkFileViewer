# Contributing Guidelines

Thank you for your interest in contributing!

# 1. How to Contribute

## Reporting Issues
- Provide clear reproduction steps.
- Include logs or screenshots when possible.

## Submitting Pull Requests
- Keep PRs focused and modular.
- Update tests when applicable.
- Provide a clear explanation of changes.

---

# 2. Coding Standards
- Follow Dart & Flutter best practices.
- Write clean, maintainable code.
- Add comments for complex logic.

---

# 3. Third-Party Package Usage Guidelines

## Licensing & Compliance
- Ensure licenses are compatible with the MIT license.
- Document licenses in `pubspec.yaml`.

## Security & Maintenance
- Prefer well-maintained packages.
- Check for vulnerabilities using `flutter pub outdated`.
- Minimize unnecessary dependencies.

## Proper Attribution
- Credit package authors when heavily influencing implementation.
- Report issues responsibly to maintainers.

## Behavioral Expectations
- Be respectful to third-party maintainers.
- Avoid misuse (rate limit abuse, etc.)
- Test integrations thoroughly.

---

# 4. Package-Specific Guidelines
Key dependencies used in this project:
- **easy_image_viewer** — Image viewing with double-tap zoom functionality
- **flutter_cached_pdfview** — PDF viewing with built-in caching support

Follow official documentation and test across all relevant platforms (Android and iOS).

---

# 5. Running the Project

```bash
flutter pub get
flutter run
```

---

# 6. Code of Conduct

By contributing, you agree to follow our CODE_OF_CONDUCT.md.