FROM registry.access.redhat.com/ubi9/python-39@sha256:082eea7aef9c7ae830a9d296b54cdbbff36ca1ec9bb50b3046dd7144b1f608a2

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
