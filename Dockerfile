FROM registry.access.redhat.com/ubi9/python-39@sha256:c2e6814ba5dc4519e66c8c4d322526756808e36d947376a79e5e5432e7166008

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
