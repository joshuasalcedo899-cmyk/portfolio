# Apple Human Interface Guidelines Notes

This project applies Apple Human Interface Guidelines as a design direction for
the Flutter portfolio UI. The goal is not to clone iOS chrome, but to keep the
experience clear, adaptive, and comfortable on Apple platforms.

## Applied Principles

- Use semantic, system-like colors that support light and dark appearance.
- Keep body text readable, with a 17 pt baseline and layouts that tolerate
  larger accessibility text.
- Preserve comfortable control targets, especially 44x44 pt tap areas for
  primary touch controls.
- Avoid hover-only navigation; every portfolio tile keeps a visible label and
  action affordance.
- Use familiar direct-manipulation patterns: tappable cards, icon buttons with
  tooltips, simple modal sheets, and predictable back/navigation actions.
- Avoid relying on color alone by pairing interactive states with labels,
  icons, spacing, and hierarchy.

## Local Implementation

- `lib/constants/app_theme.dart` defines the app-wide Apple-inspired theme.
- `lib/constants/app_colors.dart` centralizes dynamic Cupertino color tokens.
- `lib/widgets/modals/apple_dialog_scaffold.dart` provides the shared modal
  sheet structure.
- Home tiles, project cards, dialogs, chips, gallery controls, and contact
  links now use the shared sizing, color, and typography decisions.

## References

- Apple Human Interface Guidelines: Accessibility
  https://developer.apple.com/design/human-interface-guidelines/accessibility
- Apple Human Interface Guidelines: Typography
  https://developer.apple.com/design/human-interface-guidelines/typography
- Apple Human Interface Guidelines: Color
  https://developer.apple.com/design/human-interface-guidelines/color
