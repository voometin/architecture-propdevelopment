#!/bin/bash
echo "Creating user 'software_developer'..."
openssl genrsa -out software_developer.key 2048
openssl req -new -key software_developer.key -out software_developer.csr -subj "/CN=software_developer/O=group-editor"
openssl x509 -req -in software_developer.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out software_developer.crt -days 365
kubectl config set-credentials software_developer --client-certificate=software_developer.crt --client-key=software_developer.key
kubectl config set-context software_developer-context --cluster=minikube --user=software_developer

echo "Creating user 'information_security_engineer'..."
openssl genrsa -out information_security_engineer.key 2048
openssl req -new -key information_security_engineer.key -out information_security_engineer.csr -subj "/CN=information_security_engineer/O=group-editor"
openssl x509 -req -in information_security_engineer.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out information_security_engineer.crt -days 365
kubectl config set-credentials information_security_engineer --client-certificate=information_security_engineer.crt --client-key=information_security_engineer.key
kubectl config set-context information_security_engineer-context --cluster=minikube --user=information_security_engineer