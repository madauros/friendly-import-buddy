ALTER TABLE public.submissions
  ADD COLUMN IF NOT EXISTS grade numeric(5,2),
  ADD COLUMN IF NOT EXISTS graded_at timestamp with time zone;

CREATE POLICY "Teachers grade their submissions"
ON public.submissions
FOR UPDATE
TO authenticated
USING (auth.uid() = teacher_id)
WITH CHECK (auth.uid() = teacher_id);