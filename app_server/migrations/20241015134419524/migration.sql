BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "generative_ai_conversation" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "generative_ai_message" (
    "id" bigserial PRIMARY KEY,
    "sessionId" uuid NOT NULL,
    "conversationId" bigint NOT NULL,
    "aiModelName" text NOT NULL,
    "messageType" text NOT NULL,
    "content" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "generative_ai_conversation"
    ADD CONSTRAINT "generative_ai_conversation_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "generative_ai_message"
    ADD CONSTRAINT "generative_ai_message_fk_0"
    FOREIGN KEY("conversationId")
    REFERENCES "generative_ai_conversation"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR app
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('app', '20241015134419524', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241015134419524', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
