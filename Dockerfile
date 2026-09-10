FROM registry.access.redhat.com/ubi9/python-39@sha256:74f7e6f4ff76fca7b316c32bbda7a27ca151a34581724b6837b11c6259559c5b

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
