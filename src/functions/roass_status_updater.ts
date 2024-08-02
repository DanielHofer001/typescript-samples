import { app, InvocationContext, Timer } from '@azure/functions';

export async function roass_status_updater(
  myTimer: Timer,
  context: InvocationContext
): Promise<void> {
  context.log(`Timer function processed request.${JSON.stringify(myTimer)}`);
}

app.timer('roass_status_updater', {
  schedule: '0 */5 * * * *',
  handler: roass_status_updater,
});
