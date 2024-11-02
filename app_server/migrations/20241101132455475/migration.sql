BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "generative_ai_message" ADD COLUMN "image" json;

--
-- MIGRATION VERSION FOR app
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('app', '20241101132455475', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241101132455475', "timestamp" = now();

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
