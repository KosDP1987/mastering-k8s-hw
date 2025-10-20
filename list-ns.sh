#!/bin/bash
for ns in $(kubectl get namespaces -o jsonpath="{.items[*].metadata.name}"); do
  echo "=== Неймспейс: $ns ==="
  echo "Поди:"
  kubectl get pods -n $ns -o wide 2>/dev/null || echo "  (немає подів)"
  echo "Сервіси:"
  kubectl get services -n $ns 2>/dev/null || echo "  (немає сервісів)"
  echo "Деплойменти:"
  kubectl get deployments -n $ns 2>/dev/null || echo "  (немає деплойментів)"
  echo "---"
done