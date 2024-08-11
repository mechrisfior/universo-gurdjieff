/*
  Warnings:

  - Added the required column `scala_id` to the `Ottave` table without a default value. This is not possible if the table is not empty.
  - Added the required column `timeline_id` to the `Ottave` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Ottave" ADD COLUMN     "scala_id" INTEGER NOT NULL,
ADD COLUMN     "timeline_id" INTEGER NOT NULL;

-- CreateTable
CREATE TABLE "Scale" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "descrizione" TEXT NOT NULL,
    "livello" INTEGER NOT NULL,

    CONSTRAINT "Scale_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Timeline" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "descrizione" TEXT NOT NULL,
    "data_inizio" TIMESTAMP(3) NOT NULL,
    "data_fine" TIMESTAMP(3),
    "scala_id" INTEGER NOT NULL,

    CONSTRAINT "Timeline_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Ottave" ADD CONSTRAINT "Ottave_scala_id_fkey" FOREIGN KEY ("scala_id") REFERENCES "Scale"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ottave" ADD CONSTRAINT "Ottave_timeline_id_fkey" FOREIGN KEY ("timeline_id") REFERENCES "Timeline"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Timeline" ADD CONSTRAINT "Timeline_scala_id_fkey" FOREIGN KEY ("scala_id") REFERENCES "Scale"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
