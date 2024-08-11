-- AlterTable
ALTER TABLE "Relazioni_Temporali" ADD COLUMN     "segmento_id" INTEGER;

-- CreateTable
CREATE TABLE "Idrogeni" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "densita" DOUBLE PRECISION NOT NULL,
    "frequenza" DOUBLE PRECISION NOT NULL,
    "forza_id" INTEGER NOT NULL,
    "ottava_id" INTEGER NOT NULL,

    CONSTRAINT "Idrogeni_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_Eventi_CosmiciToMisure_Temporali" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_Eventi_CosmiciToMisure_Temporali_AB_unique" ON "_Eventi_CosmiciToMisure_Temporali"("A", "B");

-- CreateIndex
CREATE INDEX "_Eventi_CosmiciToMisure_Temporali_B_index" ON "_Eventi_CosmiciToMisure_Temporali"("B");

-- AddForeignKey
ALTER TABLE "Relazioni_Temporali" ADD CONSTRAINT "Relazioni_Temporali_segmento_id_fkey" FOREIGN KEY ("segmento_id") REFERENCES "Segmenti"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Idrogeni" ADD CONSTRAINT "Idrogeni_forza_id_fkey" FOREIGN KEY ("forza_id") REFERENCES "Forze"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Idrogeni" ADD CONSTRAINT "Idrogeni_ottava_id_fkey" FOREIGN KEY ("ottava_id") REFERENCES "Ottave"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Eventi_CosmiciToMisure_Temporali" ADD CONSTRAINT "_Eventi_CosmiciToMisure_Temporali_A_fkey" FOREIGN KEY ("A") REFERENCES "Eventi_Cosmici"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Eventi_CosmiciToMisure_Temporali" ADD CONSTRAINT "_Eventi_CosmiciToMisure_Temporali_B_fkey" FOREIGN KEY ("B") REFERENCES "Misure_Temporali"("id") ON DELETE CASCADE ON UPDATE CASCADE;
