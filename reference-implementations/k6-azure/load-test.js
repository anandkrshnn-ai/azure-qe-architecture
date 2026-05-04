import http from 'k6/http';
import { check, sleep } from 'k6';

export const options = {
  stages: [
    { duration: '30s', target: 100 }, // Ramp up to 100 users
    { duration: '2m', target: 100 },  // Maintain load
    { duration: '30s', target: 0 },   // Ramp down
  ],
  thresholds: {
    http_req_duration: ['p(95)<800'], // 95% of requests must be below 800ms
    http_req_failed: ['rate<0.001'],  // Less than 0.1% failure rate
  },
};

export default function () {
  // Targeting an Azure App Service or AKS Load Balancer
  const res = http.get('https://my-azure-app.azurewebsites.net/api/v1/health');
  
  check(res, {
    'status is 200': (r) => r.status === 200,
    'latency is acceptable': (r) => r.timings.duration < 1000,
  });
  
  sleep(0.5);
}
