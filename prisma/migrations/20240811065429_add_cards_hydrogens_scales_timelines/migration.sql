/*
  Warnings:

  - You are about to drop the column `forza_id` on the `Idrogeni` table. All the data in the column will be lost.
  - You are about to drop the column `frequenza` on the `Idrogeni` table. All the data in the column will be lost.
  - You are about to drop the column `scala_id` on the `Ottave` table. All the data in the column will be lost.
  - You are about to drop the column `timeline_id` on the `Ottave` table. All the data in the column will be lost.
  - You are about to drop the column `segmento_id` on the `Relazioni_Temporali` table. All the data in the column will be lost.
  - You are about to drop the column `descrizione` on the `Scale` table. All the data in the column will be lost.
  - You are about to drop the column `data_fine` on the `Timeline` table. All the data in the column will be lost.
  - You are about to drop the column `data_inizio` on the `Timeline` table. All the data in the column will be lost.
  - You are about to drop the column `descrizione` on the `Timeline` table. All the data in the column will be lost.
  - You are about to drop the `Segmenti` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_Eventi_CosmiciToMisure_Temporali` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Idrogeni" DROP CONSTRAINT "Idrogeni_forza_id_fkey";

-- DropForeignKey
ALTER TABLE "Ottave" DROP CONSTRAINT "Ottave_scala_id_fkey";

-- DropForeignKey
ALTER TABLE "Ottave" DROP CONSTRAINT "Ottave_timeline_id_fkey";

-- DropForeignKey
ALTER TABLE "Relazioni_Temporali" DROP CONSTRAINT "Relazioni_Temporali_segmento_id_fkey";

-- DropForeignKey
ALTER TABLE "_Eventi_CosmiciToMisure_Temporali" DROP CONSTRAINT "_Eventi_CosmiciToMisure_Temporali_A_fkey";

-- DropForeignKey
ALTER TABLE "_Eventi_CosmiciToMisure_Temporali" DROP CONSTRAINT "_Eventi_CosmiciToMisure_Temporali_B_fkey";

-- AlterTable
ALTER TABLE "Idrogeni" DROP COLUMN "forza_id",
DROP COLUMN "frequenza";

-- AlterTable
ALTER TABLE "Ottave" DROP COLUMN "scala_id",
DROP COLUMN "timeline_id";

-- AlterTable
ALTER TABLE "Relazioni_Temporali" DROP COLUMN "segmento_id";

-- AlterTable
ALTER TABLE "Scale" DROP COLUMN "descrizione";

-- AlterTable
ALTER TABLE "Timeline" DROP COLUMN "data_fine",
DROP COLUMN "data_inizio",
DROP COLUMN "descrizione";

-- DropTable
DROP TABLE "Segmenti";

-- DropTable
DROP TABLE "_Eventi_CosmiciToMisure_Temporali";

-- CreateTable
CREATE TABLE "Carte" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "descrizione" TEXT NOT NULL,
    "tipo" TEXT NOT NULL,
    "evento_id" INTEGER,
    "forza_id" INTEGER,
    "legge_cosmica_id" INTEGER,

    CONSTRAINT "Carte_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_ScaleOttaveRelation" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_TimelineOttaveRelation" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_AnomalieCarteRelation" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_ScaleOttaveRelation_AB_unique" ON "_ScaleOttaveRelation"("A", "B");

-- CreateIndex
CREATE INDEX "_ScaleOttaveRelation_B_index" ON "_ScaleOttaveRelation"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_TimelineOttaveRelation_AB_unique" ON "_TimelineOttaveRelation"("A", "B");

-- CreateIndex
CREATE INDEX "_TimelineOttaveRelation_B_index" ON "_TimelineOttaveRelation"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_AnomalieCarteRelation_AB_unique" ON "_AnomalieCarteRelation"("A", "B");

-- CreateIndex
CREATE INDEX "_AnomalieCarteRelation_B_index" ON "_AnomalieCarteRelation"("B");

-- AddForeignKey
ALTER TABLE "Carte" ADD CONSTRAINT "Carte_evento_id_fkey" FOREIGN KEY ("evento_id") REFERENCES "Eventi_Cosmici"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Carte" ADD CONSTRAINT "Carte_forza_id_fkey" FOREIGN KEY ("forza_id") REFERENCES "Forze"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Carte" ADD CONSTRAINT "Carte_legge_cosmica_id_fkey" FOREIGN KEY ("legge_cosmica_id") REFERENCES "Leggi_Cosmiche"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ScaleOttaveRelation" ADD CONSTRAINT "_ScaleOttaveRelation_A_fkey" FOREIGN KEY ("A") REFERENCES "Ottave"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ScaleOttaveRelation" ADD CONSTRAINT "_ScaleOttaveRelation_B_fkey" FOREIGN KEY ("B") REFERENCES "Scale"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_TimelineOttaveRelation" ADD CONSTRAINT "_TimelineOttaveRelation_A_fkey" FOREIGN KEY ("A") REFERENCES "Ottave"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_TimelineOttaveRelation" ADD CONSTRAINT "_TimelineOttaveRelation_B_fkey" FOREIGN KEY ("B") REFERENCES "Timeline"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AnomalieCarteRelation" ADD CONSTRAINT "_AnomalieCarteRelation_A_fkey" FOREIGN KEY ("A") REFERENCES "Anomalie_Cosmiche"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AnomalieCarteRelation" ADD CONSTRAINT "_AnomalieCarteRelation_B_fkey" FOREIGN KEY ("B") REFERENCES "Carte"("id") ON DELETE CASCADE ON UPDATE CASCADE;
