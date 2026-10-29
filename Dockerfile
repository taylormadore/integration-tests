FROM registry.access.redhat.com/ubi9/python-39@sha256:4a188d479ea30c6211f9cee1e16d33c6dfc8a65708184a78e1fe2623ed7b5f07

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
