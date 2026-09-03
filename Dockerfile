FROM registry.access.redhat.com/ubi9/python-39@sha256:44068cf7ea834e1b4a18dd99bdfb8c879150685178355b7181455306195ee425

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
