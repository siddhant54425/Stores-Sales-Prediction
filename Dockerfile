# lightweight python
FROM python:3.7-slim

RUN apt-get update && apt-get install -y libgomp1

# Copy local code to the container image.
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./

RUN ls -la $APP_HOME/


# Install dependencies
RUN pip install -r requirements.txt

ENV PORT 5000

# Run the flask service on container startup
CMD [ "python", "app.py" ]
