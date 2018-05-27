Please configure analysis_options.yaml like follow:

```
analyzer:
  strong-mode: true
  
linter:
  rules:
    - cancel_subscriptions
    - hash_and_equals
    - iterable_contains_unrelated_type
    - list_remove_unrelated_type
    - test_types_in_equals
    - unrelated_type_equality_checks
    - valid_regexps
    - always_declare_return_types
```
