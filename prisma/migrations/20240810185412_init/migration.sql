-- CreateTable
CREATE TABLE "Forze" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "descrizione" TEXT NOT NULL,
    "tipo" TEXT NOT NULL,

    CONSTRAINT "Forze_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Ottave" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "frequenza_iniziale" DOUBLE PRECISION NOT NULL,
    "frequenza_finale" DOUBLE PRECISION NOT NULL,
    "forza_id" INTEGER NOT NULL,
    "descrizione" TEXT NOT NULL,
    "livello" INTEGER NOT NULL,

    CONSTRAINT "Ottave_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Segmenti" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "descrizione" TEXT NOT NULL,
    "ordine" INTEGER NOT NULL,

    CONSTRAINT "Segmenti_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Leggi_Cosmiche" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "descrizione" TEXT NOT NULL,
    "categoria" TEXT NOT NULL,

    CONSTRAINT "Leggi_Cosmiche_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Relazioni_Ottave" (
    "id" SERIAL NOT NULL,
    "ottava_superiore_id" INTEGER NOT NULL,
    "ottava_inferiore_id" INTEGER NOT NULL,
    "tipo_relazione" TEXT NOT NULL,

    CONSTRAINT "Relazioni_Ottave_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Vibration" (
    "id" SERIAL NOT NULL,
    "frequenza" DOUBLE PRECISION NOT NULL,
    "intensita" DOUBLE PRECISION NOT NULL,
    "fase" TEXT NOT NULL,
    "ottava_id" INTEGER NOT NULL,

    CONSTRAINT "Vibration_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Entita_Cosmiche" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "descrizione" TEXT NOT NULL,
    "tipo" TEXT NOT NULL,
    "ottava_id" INTEGER NOT NULL,

    CONSTRAINT "Entita_Cosmiche_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Processi_Cosmici" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "descrizione" TEXT NOT NULL,
    "forza_id" INTEGER NOT NULL,
    "legge_id" INTEGER NOT NULL,

    CONSTRAINT "Processi_Cosmici_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Oscillazioni" (
    "id" SERIAL NOT NULL,
    "frequenza" DOUBLE PRECISION NOT NULL,
    "amplitudine" DOUBLE PRECISION NOT NULL,
    "fase" TEXT NOT NULL,
    "tipo" TEXT NOT NULL,
    "entita_cosmica_id" INTEGER NOT NULL,

    CONSTRAINT "Oscillazioni_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Eventi_Cosmici" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "descrizione" TEXT NOT NULL,
    "data_inizio" TIMESTAMP(3) NOT NULL,
    "data_fine" TIMESTAMP(3),

    CONSTRAINT "Eventi_Cosmici_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Relazioni_Entita" (
    "id" SERIAL NOT NULL,
    "entita_superiore_id" INTEGER NOT NULL,
    "entita_inferiore_id" INTEGER NOT NULL,
    "tipo_relazione" TEXT NOT NULL,

    CONSTRAINT "Relazioni_Entita_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Misure_Temporali" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "descrizione" TEXT NOT NULL,
    "ciclo_iniziale" DOUBLE PRECISION NOT NULL,
    "ciclo_finale" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "Misure_Temporali_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Attributi_Dinamici" (
    "id" SERIAL NOT NULL,
    "entita_cosmica_id" INTEGER NOT NULL,
    "nome" TEXT NOT NULL,
    "valore" TEXT NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Attributi_Dinamici_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Relazioni_Temporali" (
    "id" SERIAL NOT NULL,
    "evento_id" INTEGER NOT NULL,
    "misura_temporale_id" INTEGER NOT NULL,
    "tipo_relazione" TEXT NOT NULL,

    CONSTRAINT "Relazioni_Temporali_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Flussi_Energetici" (
    "id" SERIAL NOT NULL,
    "entita_origine_id" INTEGER NOT NULL,
    "entita_destinazione_id" INTEGER NOT NULL,
    "quantita_energia" DOUBLE PRECISION NOT NULL,
    "condizioni_trasferimento" TEXT NOT NULL,

    CONSTRAINT "Flussi_Energetici_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Regioni_Cosmiche" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "descrizione" TEXT NOT NULL,
    "tipo" TEXT NOT NULL,
    "coordinate_spaziali" TEXT NOT NULL,

    CONSTRAINT "Regioni_Cosmiche_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Simbologie_Esoteriche" (
    "id" SERIAL NOT NULL,
    "simbolo" TEXT NOT NULL,
    "descrizione" TEXT NOT NULL,
    "legge_cosmica_id" INTEGER NOT NULL,
    "evento_cosmico_id" INTEGER NOT NULL,

    CONSTRAINT "Simbologie_Esoteriche_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cicli_Evolutivi" (
    "id" SERIAL NOT NULL,
    "entita_id" INTEGER NOT NULL,
    "ciclo_iniziale" DOUBLE PRECISION NOT NULL,
    "ciclo_finale" DOUBLE PRECISION NOT NULL,
    "trasformazioni" TEXT NOT NULL,

    CONSTRAINT "Cicli_Evolutivi_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Anomalie_Cosmiche" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "descrizione" TEXT NOT NULL,
    "impatti" TEXT NOT NULL,
    "regione_id" INTEGER,

    CONSTRAINT "Anomalie_Cosmiche_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_Eventi_CosmiciToProcessi_Cosmici" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_Eventi_CosmiciToProcessi_Cosmici_AB_unique" ON "_Eventi_CosmiciToProcessi_Cosmici"("A", "B");

-- CreateIndex
CREATE INDEX "_Eventi_CosmiciToProcessi_Cosmici_B_index" ON "_Eventi_CosmiciToProcessi_Cosmici"("B");

-- AddForeignKey
ALTER TABLE "Ottave" ADD CONSTRAINT "Ottave_forza_id_fkey" FOREIGN KEY ("forza_id") REFERENCES "Forze"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Relazioni_Ottave" ADD CONSTRAINT "Relazioni_Ottave_ottava_superiore_id_fkey" FOREIGN KEY ("ottava_superiore_id") REFERENCES "Ottave"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Relazioni_Ottave" ADD CONSTRAINT "Relazioni_Ottave_ottava_inferiore_id_fkey" FOREIGN KEY ("ottava_inferiore_id") REFERENCES "Ottave"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Vibration" ADD CONSTRAINT "Vibration_ottava_id_fkey" FOREIGN KEY ("ottava_id") REFERENCES "Ottave"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Entita_Cosmiche" ADD CONSTRAINT "Entita_Cosmiche_ottava_id_fkey" FOREIGN KEY ("ottava_id") REFERENCES "Ottave"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Processi_Cosmici" ADD CONSTRAINT "Processi_Cosmici_forza_id_fkey" FOREIGN KEY ("forza_id") REFERENCES "Forze"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Processi_Cosmici" ADD CONSTRAINT "Processi_Cosmici_legge_id_fkey" FOREIGN KEY ("legge_id") REFERENCES "Leggi_Cosmiche"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Oscillazioni" ADD CONSTRAINT "Oscillazioni_entita_cosmica_id_fkey" FOREIGN KEY ("entita_cosmica_id") REFERENCES "Entita_Cosmiche"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Relazioni_Entita" ADD CONSTRAINT "Relazioni_Entita_entita_superiore_id_fkey" FOREIGN KEY ("entita_superiore_id") REFERENCES "Entita_Cosmiche"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Relazioni_Entita" ADD CONSTRAINT "Relazioni_Entita_entita_inferiore_id_fkey" FOREIGN KEY ("entita_inferiore_id") REFERENCES "Entita_Cosmiche"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Attributi_Dinamici" ADD CONSTRAINT "Attributi_Dinamici_entita_cosmica_id_fkey" FOREIGN KEY ("entita_cosmica_id") REFERENCES "Entita_Cosmiche"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Relazioni_Temporali" ADD CONSTRAINT "Relazioni_Temporali_evento_id_fkey" FOREIGN KEY ("evento_id") REFERENCES "Eventi_Cosmici"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Relazioni_Temporali" ADD CONSTRAINT "Relazioni_Temporali_misura_temporale_id_fkey" FOREIGN KEY ("misura_temporale_id") REFERENCES "Misure_Temporali"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Flussi_Energetici" ADD CONSTRAINT "Flussi_Energetici_entita_origine_id_fkey" FOREIGN KEY ("entita_origine_id") REFERENCES "Entita_Cosmiche"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Flussi_Energetici" ADD CONSTRAINT "Flussi_Energetici_entita_destinazione_id_fkey" FOREIGN KEY ("entita_destinazione_id") REFERENCES "Entita_Cosmiche"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Simbologie_Esoteriche" ADD CONSTRAINT "Simbologie_Esoteriche_legge_cosmica_id_fkey" FOREIGN KEY ("legge_cosmica_id") REFERENCES "Leggi_Cosmiche"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Simbologie_Esoteriche" ADD CONSTRAINT "Simbologie_Esoteriche_evento_cosmico_id_fkey" FOREIGN KEY ("evento_cosmico_id") REFERENCES "Eventi_Cosmici"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cicli_Evolutivi" ADD CONSTRAINT "Cicli_Evolutivi_entita_id_fkey" FOREIGN KEY ("entita_id") REFERENCES "Entita_Cosmiche"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Anomalie_Cosmiche" ADD CONSTRAINT "Anomalie_Cosmiche_regione_id_fkey" FOREIGN KEY ("regione_id") REFERENCES "Regioni_Cosmiche"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Eventi_CosmiciToProcessi_Cosmici" ADD CONSTRAINT "_Eventi_CosmiciToProcessi_Cosmici_A_fkey" FOREIGN KEY ("A") REFERENCES "Eventi_Cosmici"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Eventi_CosmiciToProcessi_Cosmici" ADD CONSTRAINT "_Eventi_CosmiciToProcessi_Cosmici_B_fkey" FOREIGN KEY ("B") REFERENCES "Processi_Cosmici"("id") ON DELETE CASCADE ON UPDATE CASCADE;
