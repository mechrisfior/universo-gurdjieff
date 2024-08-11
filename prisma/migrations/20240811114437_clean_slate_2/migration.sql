/*
  Warnings:

  - You are about to drop the `Anomalie_Cosmiche` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Attributi_Dinamici` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Carte` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Cicli_Evolutivi` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Entita_Cosmiche` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Eventi_Cosmici` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Flussi_Energetici` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Forze` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Idrogeni` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Leggi_Cosmiche` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Misure_Temporali` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Oscillazioni` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Ottave` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Processi_Cosmici` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Regioni_Cosmiche` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Relazioni_Entita` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Relazioni_Ottave` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Relazioni_Temporali` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Scale` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Segmenti` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Simbologie_Esoteriche` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Timeline` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Vibration` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_AnomalieCarteRelation` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_Eventi_CosmiciToProcessi_Cosmici` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_ScaleOttaveRelation` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_TimelineEventiRelation` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_TimelineOttaveRelation` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Anomalie_Cosmiche" DROP CONSTRAINT "Anomalie_Cosmiche_regione_id_fkey";

-- DropForeignKey
ALTER TABLE "Attributi_Dinamici" DROP CONSTRAINT "Attributi_Dinamici_entita_cosmica_id_fkey";

-- DropForeignKey
ALTER TABLE "Carte" DROP CONSTRAINT "Carte_eventi_CosmiciId_fkey";

-- DropForeignKey
ALTER TABLE "Carte" DROP CONSTRAINT "Carte_forza_id_fkey";

-- DropForeignKey
ALTER TABLE "Carte" DROP CONSTRAINT "Carte_legge_cosmica_id_fkey";

-- DropForeignKey
ALTER TABLE "Carte" DROP CONSTRAINT "Carte_ottava_id_fkey";

-- DropForeignKey
ALTER TABLE "Cicli_Evolutivi" DROP CONSTRAINT "Cicli_Evolutivi_entita_id_fkey";

-- DropForeignKey
ALTER TABLE "Entita_Cosmiche" DROP CONSTRAINT "Entita_Cosmiche_ottava_id_fkey";

-- DropForeignKey
ALTER TABLE "Flussi_Energetici" DROP CONSTRAINT "Flussi_Energetici_entita_destinazione_id_fkey";

-- DropForeignKey
ALTER TABLE "Flussi_Energetici" DROP CONSTRAINT "Flussi_Energetici_entita_origine_id_fkey";

-- DropForeignKey
ALTER TABLE "Idrogeni" DROP CONSTRAINT "Idrogeni_ottava_id_fkey";

-- DropForeignKey
ALTER TABLE "Oscillazioni" DROP CONSTRAINT "Oscillazioni_entita_cosmica_id_fkey";

-- DropForeignKey
ALTER TABLE "Ottave" DROP CONSTRAINT "Ottave_forza_id_fkey";

-- DropForeignKey
ALTER TABLE "Processi_Cosmici" DROP CONSTRAINT "Processi_Cosmici_forza_id_fkey";

-- DropForeignKey
ALTER TABLE "Processi_Cosmici" DROP CONSTRAINT "Processi_Cosmici_legge_id_fkey";

-- DropForeignKey
ALTER TABLE "Relazioni_Entita" DROP CONSTRAINT "Relazioni_Entita_entita_inferiore_id_fkey";

-- DropForeignKey
ALTER TABLE "Relazioni_Entita" DROP CONSTRAINT "Relazioni_Entita_entita_superiore_id_fkey";

-- DropForeignKey
ALTER TABLE "Relazioni_Temporali" DROP CONSTRAINT "Relazioni_Temporali_evento_id_fkey";

-- DropForeignKey
ALTER TABLE "Relazioni_Temporali" DROP CONSTRAINT "Relazioni_Temporali_misura_temporale_id_fkey";

-- DropForeignKey
ALTER TABLE "Simbologie_Esoteriche" DROP CONSTRAINT "Simbologie_Esoteriche_evento_cosmico_id_fkey";

-- DropForeignKey
ALTER TABLE "Simbologie_Esoteriche" DROP CONSTRAINT "Simbologie_Esoteriche_legge_cosmica_id_fkey";

-- DropForeignKey
ALTER TABLE "Timeline" DROP CONSTRAINT "Timeline_scala_id_fkey";

-- DropForeignKey
ALTER TABLE "Vibration" DROP CONSTRAINT "Vibration_ottava_id_fkey";

-- DropForeignKey
ALTER TABLE "_AnomalieCarteRelation" DROP CONSTRAINT "_AnomalieCarteRelation_A_fkey";

-- DropForeignKey
ALTER TABLE "_AnomalieCarteRelation" DROP CONSTRAINT "_AnomalieCarteRelation_B_fkey";

-- DropForeignKey
ALTER TABLE "_Eventi_CosmiciToProcessi_Cosmici" DROP CONSTRAINT "_Eventi_CosmiciToProcessi_Cosmici_A_fkey";

-- DropForeignKey
ALTER TABLE "_Eventi_CosmiciToProcessi_Cosmici" DROP CONSTRAINT "_Eventi_CosmiciToProcessi_Cosmici_B_fkey";

-- DropForeignKey
ALTER TABLE "_ScaleOttaveRelation" DROP CONSTRAINT "_ScaleOttaveRelation_A_fkey";

-- DropForeignKey
ALTER TABLE "_ScaleOttaveRelation" DROP CONSTRAINT "_ScaleOttaveRelation_B_fkey";

-- DropForeignKey
ALTER TABLE "_TimelineEventiRelation" DROP CONSTRAINT "_TimelineEventiRelation_A_fkey";

-- DropForeignKey
ALTER TABLE "_TimelineEventiRelation" DROP CONSTRAINT "_TimelineEventiRelation_B_fkey";

-- DropForeignKey
ALTER TABLE "_TimelineOttaveRelation" DROP CONSTRAINT "_TimelineOttaveRelation_A_fkey";

-- DropForeignKey
ALTER TABLE "_TimelineOttaveRelation" DROP CONSTRAINT "_TimelineOttaveRelation_B_fkey";

-- DropTable
DROP TABLE "Anomalie_Cosmiche";

-- DropTable
DROP TABLE "Attributi_Dinamici";

-- DropTable
DROP TABLE "Carte";

-- DropTable
DROP TABLE "Cicli_Evolutivi";

-- DropTable
DROP TABLE "Entita_Cosmiche";

-- DropTable
DROP TABLE "Eventi_Cosmici";

-- DropTable
DROP TABLE "Flussi_Energetici";

-- DropTable
DROP TABLE "Forze";

-- DropTable
DROP TABLE "Idrogeni";

-- DropTable
DROP TABLE "Leggi_Cosmiche";

-- DropTable
DROP TABLE "Misure_Temporali";

-- DropTable
DROP TABLE "Oscillazioni";

-- DropTable
DROP TABLE "Ottave";

-- DropTable
DROP TABLE "Processi_Cosmici";

-- DropTable
DROP TABLE "Regioni_Cosmiche";

-- DropTable
DROP TABLE "Relazioni_Entita";

-- DropTable
DROP TABLE "Relazioni_Ottave";

-- DropTable
DROP TABLE "Relazioni_Temporali";

-- DropTable
DROP TABLE "Scale";

-- DropTable
DROP TABLE "Segmenti";

-- DropTable
DROP TABLE "Simbologie_Esoteriche";

-- DropTable
DROP TABLE "Timeline";

-- DropTable
DROP TABLE "Vibration";

-- DropTable
DROP TABLE "_AnomalieCarteRelation";

-- DropTable
DROP TABLE "_Eventi_CosmiciToProcessi_Cosmici";

-- DropTable
DROP TABLE "_ScaleOttaveRelation";

-- DropTable
DROP TABLE "_TimelineEventiRelation";

-- DropTable
DROP TABLE "_TimelineOttaveRelation";

-- CreateTable
CREATE TABLE "Forza" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "descrizione" TEXT,
    "tipo" TEXT NOT NULL,

    CONSTRAINT "Forza_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Ottava" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "frequenzaIniziale" DOUBLE PRECISION NOT NULL,
    "frequenzaFinale" DOUBLE PRECISION NOT NULL,
    "descrizione" TEXT,
    "livello" INTEGER NOT NULL,
    "forzaId" INTEGER NOT NULL,

    CONSTRAINT "Ottava_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Segmento" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "descrizione" TEXT,
    "ordine" INTEGER NOT NULL,

    CONSTRAINT "Segmento_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LeggeCosmica" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "descrizione" TEXT,
    "categoria" TEXT,

    CONSTRAINT "LeggeCosmica_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RelazioneOttava" (
    "id" SERIAL NOT NULL,
    "ottavaSuperioreId" INTEGER NOT NULL,
    "ottavaInferioreId" INTEGER NOT NULL,
    "tipoRelazione" TEXT NOT NULL,

    CONSTRAINT "RelazioneOttava_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Vibrazione" (
    "id" SERIAL NOT NULL,
    "frequenza" DOUBLE PRECISION NOT NULL,
    "intensita" DOUBLE PRECISION,
    "fase" TEXT,
    "ottavaId" INTEGER NOT NULL,

    CONSTRAINT "Vibrazione_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EntitaCosmica" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "descrizione" TEXT,
    "tipo" TEXT NOT NULL,
    "ottavaId" INTEGER NOT NULL,

    CONSTRAINT "EntitaCosmica_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProcessoCosmico" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "descrizione" TEXT,
    "forzaId" INTEGER NOT NULL,
    "leggeCosmicaId" INTEGER NOT NULL,

    CONSTRAINT "ProcessoCosmico_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Oscillazione" (
    "id" SERIAL NOT NULL,
    "frequenza" DOUBLE PRECISION NOT NULL,
    "amplitudine" DOUBLE PRECISION,
    "fase" TEXT,
    "entitaCosmicaId" INTEGER NOT NULL,

    CONSTRAINT "Oscillazione_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AttributoDinamico" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "valore" TEXT NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL,
    "entitaCosmicaId" INTEGER NOT NULL,

    CONSTRAINT "AttributoDinamico_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Ottava" ADD CONSTRAINT "Ottava_forzaId_fkey" FOREIGN KEY ("forzaId") REFERENCES "Forza"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RelazioneOttava" ADD CONSTRAINT "RelazioneOttava_ottavaSuperioreId_fkey" FOREIGN KEY ("ottavaSuperioreId") REFERENCES "Ottava"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RelazioneOttava" ADD CONSTRAINT "RelazioneOttava_ottavaInferioreId_fkey" FOREIGN KEY ("ottavaInferioreId") REFERENCES "Ottava"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Vibrazione" ADD CONSTRAINT "Vibrazione_ottavaId_fkey" FOREIGN KEY ("ottavaId") REFERENCES "Ottava"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EntitaCosmica" ADD CONSTRAINT "EntitaCosmica_ottavaId_fkey" FOREIGN KEY ("ottavaId") REFERENCES "Ottava"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProcessoCosmico" ADD CONSTRAINT "ProcessoCosmico_forzaId_fkey" FOREIGN KEY ("forzaId") REFERENCES "Forza"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProcessoCosmico" ADD CONSTRAINT "ProcessoCosmico_leggeCosmicaId_fkey" FOREIGN KEY ("leggeCosmicaId") REFERENCES "LeggeCosmica"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Oscillazione" ADD CONSTRAINT "Oscillazione_entitaCosmicaId_fkey" FOREIGN KEY ("entitaCosmicaId") REFERENCES "EntitaCosmica"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AttributoDinamico" ADD CONSTRAINT "AttributoDinamico_entitaCosmicaId_fkey" FOREIGN KEY ("entitaCosmicaId") REFERENCES "EntitaCosmica"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
