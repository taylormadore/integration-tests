FROM registry.access.redhat.com/ubi9/python-39@sha256:a74eb096739a36db1f5951b0c2f30598864e04645ee705f03935961c6eb1feca

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
