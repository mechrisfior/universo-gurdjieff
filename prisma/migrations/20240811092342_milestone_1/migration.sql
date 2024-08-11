/*
  Warnings:

  - Added the required column `energia` to the `Idrogeni` table without a default value. This is not possible if the table is not empty.
  - Added the required column `tempo_totale` to the `Scale` table without a default value. This is not possible if the table is not empty.
  - Added the required column `tempo_inizio` to the `Timeline` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Carte" DROP CONSTRAINT "Carte_evento_id_fkey";

-- DropForeignKey
ALTER TABLE "Relazioni_Ottave" DROP CONSTRAINT "Relazioni_Ottave_ottava_inferiore_id_fkey";

-- DropForeignKey
ALTER TABLE "Relazioni_Ottave" DROP CONSTRAINT "Relazioni_Ottave_ottava_superiore_id_fkey";

-- AlterTable
ALTER TABLE "Carte" ADD COLUMN     "eventi_CosmiciId" INTEGER,
ADD COLUMN     "livello_energia" DOUBLE PRECISION,
ADD COLUMN     "ottava_id" INTEGER,
ADD COLUMN     "significato_temporale" TEXT;

-- AlterTable
ALTER TABLE "Eventi_Cosmici" ADD COLUMN     "importanza" INTEGER;

-- AlterTable
ALTER TABLE "Forze" ADD COLUMN     "intensita" DOUBLE PRECISION,
ADD COLUMN     "origine" TEXT;

-- AlterTable
ALTER TABLE "Idrogeni" ADD COLUMN     "energia" DOUBLE PRECISION NOT NULL;

-- AlterTable
ALTER TABLE "Leggi_Cosmiche" ADD COLUMN     "applicazione" TEXT,
ADD COLUMN     "gravita" INTEGER;

-- AlterTable
ALTER TABLE "Processi_Cosmici" ADD COLUMN     "durata" INTEGER,
ADD COLUMN     "intensita" DOUBLE PRECISION;

-- AlterTable
ALTER TABLE "Relazioni_Entita" ADD COLUMN     "intensita_relazione" DOUBLE PRECISION;

-- AlterTable
ALTER TABLE "Relazioni_Ottave" ADD COLUMN     "intensita_relazione" DOUBLE PRECISION;

-- AlterTable
ALTER TABLE "Scale" ADD COLUMN     "tempo_totale" DOUBLE PRECISION NOT NULL;

-- AlterTable
ALTER TABLE "Timeline" ADD COLUMN     "tempo_fine" TIMESTAMP(3),
ADD COLUMN     "tempo_inizio" TIMESTAMP(3) NOT NULL;

-- CreateTable
CREATE TABLE "Segmenti" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "descrizione" TEXT NOT NULL,
    "ordine" INTEGER NOT NULL,

    CONSTRAINT "Segmenti_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_TimelineEventiRelation" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_TimelineEventiRelation_AB_unique" ON "_TimelineEventiRelation"("A", "B");

-- CreateIndex
CREATE INDEX "_TimelineEventiRelation_B_index" ON "_TimelineEventiRelation"("B");

-- AddForeignKey
ALTER TABLE "Carte" ADD CONSTRAINT "Carte_ottava_id_fkey" FOREIGN KEY ("ottava_id") REFERENCES "Ottave"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Carte" ADD CONSTRAINT "Carte_eventi_CosmiciId_fkey" FOREIGN KEY ("eventi_CosmiciId") REFERENCES "Eventi_Cosmici"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_TimelineEventiRelation" ADD CONSTRAINT "_TimelineEventiRelation_A_fkey" FOREIGN KEY ("A") REFERENCES "Eventi_Cosmici"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_TimelineEventiRelation" ADD CONSTRAINT "_TimelineEventiRelation_B_fkey" FOREIGN KEY ("B") REFERENCES "Timeline"("id") ON DELETE CASCADE ON UPDATE CASCADE;
