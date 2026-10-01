FROM registry.access.redhat.com/ubi9/python-39@sha256:497faf98a84a25098c59e824f3f16882214a76cd81ee7ea0cf9f810a50c0f519

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
