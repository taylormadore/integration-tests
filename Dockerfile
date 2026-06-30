FROM registry.access.redhat.com/ubi9/python-39@sha256:8916b30a424c5f25250a223d4d70e3927ddf8e3a778e12d98e355e9f5c403442

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
