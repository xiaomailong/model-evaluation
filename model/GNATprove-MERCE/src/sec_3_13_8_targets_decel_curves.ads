--  copyright 2013 David MENTRE <d.mentre@fr.merce.mee.com>
--                                 -- Mitsubishi Electric R&D Centre Europe
--
--  Licensed under the EUPL V.1.1 or - as soon they will be approved by
--  the European Commission - subsequent versions of the EUPL (the
--  "Licence");
--  You may not use this work except in compliance with the Licence.
--
--  You may obtain a copy of the Licence at:
--
--    http://joinup.ec.europa.eu/software/page/eupl/licence-eupl
--
--  Unless required by applicable law or agreed to in writing, software
--  distributed under the Licence is distributed on an "AS IS" basis,
--  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
--  implied.
--
--  See the Licence for the specific language governing permissions and
--  limitations under the Licence.

with Units; use Units;
with sec_3_13_6_deceleration; use sec_3_13_6_deceleration;

package sec_3_13_8_targets_decel_curves is
   -- ** 3.13.8.1 Introduction **

   -- SUBSET-026-3.13.8.1.1
   type Target_t is
      record
         supervise : Boolean;
         location : Distance_t;
         speed : Speed_t;
      end record;

   -- SUBSET-026-3.13.8.1.2
   -- Use of package sec_3_13_6_deceleration

   -- SUBSET-026-3.13.8.1.3 not formalized (FIXME?)

   -- ** 3.13.8.2 Determination of the supervised targets **

   -- SUBSET-026-3.13.8.2.1
   type Target_Type is (MRSP_Speed_Decrease, -- SUBSET-026-3.13.8.2.1.a
                        Limit_Of_Authority, -- SUBSET-026-3.13.8.2.1.b
                        -- SUBSET-026-3.13.8.2.1.c
                        End_Of_Authority, Supervised_Location,
                        Staff_Responsible_Maximum); -- SUBSET-026-3.13.8.2.1.d

   Target : array (Target_Type) of Target_t;

   -- Note: should be defined as data type invariant
   function Is_Valid_Target return boolean is
     ((if Target(End_Of_Authority).speed > 0.0 then
       Target(Limit_Of_Authority).supervise)
      and
        (if Target(End_Of_Authority).speed = 0.0 then
         Target(End_Of_Authority).supervise
         and Target(Supervised_Location).supervise)
      and
        Target(Staff_Responsible_Maximum).speed = 0.0);

   -- SUBSET-026-3.13.8.2.1.1 not formalized (Note)

   -- SUBSET-026-3.13.8.2.2 not formalized (FIXME)

   -- SUBSET-026-3.13.8.2.3 not formalized (FIXME)

   -- ** 3.13.8.3 Emergency Brake Deceleration Curve **
end sec_3_13_8_targets_decel_curves;

