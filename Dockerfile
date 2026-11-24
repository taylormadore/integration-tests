FROM registry.access.redhat.com/ubi9/python-39@sha256:da0c555fb735df7d4ca41c2c22ad69f62277c455aa09490c2c1152b5fd459106

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
