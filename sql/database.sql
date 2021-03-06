CREATE SCHEMA application;

CREATE TABLE application.event (
  event_id          SERIAL PRIMARY KEY,
  created_at        TIMESTAMP WITHOUT TIME ZONE   NOT NULL DEFAULT now(),
  updated_at        TIMESTAMP WITHOUT TIME ZONE   NULL,
  name              VARCHAR                       NOT NULL,
  timespan          TSRANGE                       NULL,
  max_register INTEGER                       NOT NULL
);

COMMENT ON TABLE application.event IS 'Event';

CREATE TABLE application.register (
  register_id    SERIAL PRIMARY KEY,
  event_id       INTEGER                       NOT NULL REFERENCES application.event,
  created_at     TIMESTAMP WITHOUT TIME ZONE   NOT NULL DEFAULT now(),
  updated_at     TIMESTAMP WITHOUT TIME ZONE   NULL,
  lastname       VARCHAR(255)                  NOT NULL,
  firstname      VARCHAR(255)                  NOT NULL,
  email          VARCHAR(255)                  NOT NULL,
  phone          INTEGER                       NOT NULL
);

COMMENT ON TABLE application.register IS 'Register of event';